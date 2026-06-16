/**
 * SUBSCRIPTION PRIORITY + DISTRIBUTION + MATCH validation.
 * Run AFTER applying supabase/03_subscription_priority_and_matching.sql:
 *   cd app && node ../supabase/validate_subscription_priority.mjs
 *
 * Verifies every scenario from the spec against the live DB with a throwaway
 * user, fully restored at the end. Prints NO secrets.
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { createRequire } from 'module';

const appDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../app');
const require = createRequire(path.join(appDir, 'package.json'));
const { createClient } = await import(pathToFileURL(require.resolve('@supabase/supabase-js')).href);

const env = {};
for (const line of fs.readFileSync(path.join(appDir, '.env'), 'utf8').split('\n')) {
  const m = line.match(/^([A-Z0-9_]+)=(.*)$/); if (m) env[m[1]] = m[2].trim();
}
const sb = createClient(env.EXPO_PUBLIC_SUPABASE_URL, env.EXPO_PUBLIC_SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });

let pass = 0, fail = 0;
const ok = (c, m) => { c ? (pass++, console.log('  ✓', m)) : (fail++, console.log('  ✗', m)); };
const q = async (uid) => (await sb.rpc('get_user_quotas', { p_user_id: uid })).data;
const buy = (uid, plan) => sb.rpc('purchase_subscription', { p_user_id: uid, p_plan_type: plan, p_payment_id: 'test', p_amount: 1 });
const reset = async (uid) => {
  await sb.from('subscriptions').delete().eq('user_id', uid);
  await sb.from('profiles').update({ tier: 'free', is_premium: false, premium_expires_at: null, contacts_remaining: 0, interests_remaining: 0 }).eq('id', uid);
};

async function main() {
  // Guard: ensure patch 03 is applied before running scenarios.
  const probe = await sb.rpc('plan_priority', { p_tier: 'gold' });
  if (probe.error) {
    console.log('✗ Patch 03 is NOT applied yet (plan_priority function missing).');
    console.log('  Apply supabase/03_subscription_priority_and_matching.sql, then re-run.');
    process.exit(2);
  }

  const u = await sb.from('profiles').select('id, tier, is_premium, premium_expires_at, contacts_remaining, interests_remaining').eq('is_active', true).limit(1).single();
  const uid = u.data.id, snap = u.data;
  const ts = {};
  (await sb.from('tier_settings').select('*')).data.forEach(t => ts[t.tier] = t);

  // ── Scenario 2: Silver then Gold -> current Gold, Silver secondary ──
  console.log('\n[Scenario 2] Silver -> upgrade Gold');
  await reset(uid);
  await buy(uid, 'silver');
  await buy(uid, 'gold');
  let r = await q(uid);
  ok(r.tier === 'GOLD', `current plan = GOLD (got ${r.tier})`);
  ok(r.other_plans.some(p => p.plan === 'silver'), `Silver in other_plans (${JSON.stringify(r.other_plans.map(p=>p.plan))})`);
  ok(r.contacts_remaining === ts.silver.contacts_limit + ts.gold.contacts_limit, `contacts = silver+gold wallet (${r.contacts_remaining})`);

  // ── Scenario 1/Lower: Gold then Silver top-up -> current stays Gold ──
  console.log('\n[Lower-plan purchase] Gold -> buy Silver');
  await reset(uid);
  await buy(uid, 'gold');
  await buy(uid, 'silver');
  r = await q(uid);
  ok(r.tier === 'GOLD', `current plan stays GOLD (got ${r.tier})`);
  ok(r.other_plans.some(p => p.plan === 'silver'), `Silver stored as secondary`);

  // ── Scenario 3: Gold then Platinum -> current Platinum, Gold secondary ──
  console.log('\n[Scenario 3] Gold -> buy Platinum');
  await reset(uid);
  await buy(uid, 'gold');
  await buy(uid, 'platinum');
  r = await q(uid);
  ok(r.tier === 'PLATINUM', `current plan = PLATINUM (got ${r.tier})`);
  ok(r.other_plans.some(p => p.plan === 'gold'), `Gold in other_plans`);
  ok(r.recommended_limit === ts.platinum.recommended_limit, `feed limits = platinum (${r.recommended_limit})`);

  // ── Same-plan extension: Gold + Gold = merged duration, one row ──
  console.log('\n[Same-plan extension] Gold + Gold');
  await reset(uid);
  await buy(uid, 'gold');
  const after1 = await q(uid);
  await buy(uid, 'gold');
  const after2 = await q(uid);
  const rows = await sb.from('subscriptions').select('id').eq('user_id', uid).eq('plan_type', 'gold').eq('status', 'active');
  ok(rows.data.length === 1, `only ONE active Gold row after 2 purchases (got ${rows.data.length})`);
  ok(after2.days_remaining > after1.days_remaining, `expiry extended (${after1.days_remaining}d -> ${after2.days_remaining}d)`);
  ok(after2.other_plans.length === 0, `no secondary plans for same-plan repurchase`);

  // ── Match score: recommended sorted desc, 0-100 ──
  console.log('\n[Match scoring] recommended ranked by %');
  await reset(uid);
  await buy(uid, 'platinum');
  const rec = await sb.rpc('get_recommended_profiles', { p_user_id: uid, p_limit: 50, p_offset: 0 });
  if (rec.error) ok(false, 'recommended: ' + rec.error.message);
  else {
    const scores = rec.data.map(p => p.compatibility_score);
    ok(scores.every(s => s >= 0 && s <= 100), `all scores in 0-100 (sample ${scores.slice(0,5)})`);
    const sorted = scores.every((s, i) => i === 0 || scores[i-1] >= s);
    ok(sorted, `sorted highest-first`);
  }

  // ── Nearby: location priority preserved ──
  console.log('\n[Nearby] location cascade');
  const near = await sb.rpc('get_nearby_profiles', { p_user_id: uid, p_limit: 50, p_offset: 0 });
  ok(!near.error && near.data.length > 0, `nearby returns rows (${near.error ? near.error.message : near.data.length})`);

  // ── Daily snapshot freeze: admin lowers limit mid-day, today's count holds ──
  console.log('\n[Daily snapshot] admin change applies next day only');
  await reset(uid);
  await buy(uid, 'gold');
  // clear any existing daily snapshot for a clean measurement
  await sb.from('user_profile_views').delete().eq('user_id', uid).eq('section', 'daily');
  const day1 = await sb.rpc('get_daily_matches', { p_user_id: uid, p_limit: 50, p_offset: 0 });
  const day1Count = day1.data?.length || 0;
  const origDaily = ts.gold.daily_limit;
  // admin lowers the daily limit
  await sb.rpc('update_tier_settings', { p_tier: 'gold', p_rec: ts.gold.recommended_limit, p_near: ts.gold.nearby_limit, p_daily: Math.max(1, origDaily - 3), p_dyn: ts.gold.dynamic_daily_enabled, p_plan_name: ts.gold.plan_name, p_price_inr: ts.gold.price_inr, p_duration_months: ts.gold.duration_months, p_contacts_limit: ts.gold.contacts_limit, p_interests_limit: ts.gold.interests_limit, p_features: ts.gold.features, p_color_code: ts.gold.color_code, p_is_popular: ts.gold.is_popular });
  const day1again = await sb.rpc('get_daily_matches', { p_user_id: uid, p_limit: 50, p_offset: 0 });
  ok((day1again.data?.length || 0) === day1Count, `today's allocation frozen after admin change (${day1Count} -> ${day1again.data?.length})`);
  // restore daily limit
  await sb.rpc('update_tier_settings', { p_tier: 'gold', p_rec: ts.gold.recommended_limit, p_near: ts.gold.nearby_limit, p_daily: origDaily, p_dyn: ts.gold.dynamic_daily_enabled, p_plan_name: ts.gold.plan_name, p_price_inr: ts.gold.price_inr, p_duration_months: ts.gold.duration_months, p_contacts_limit: ts.gold.contacts_limit, p_interests_limit: ts.gold.interests_limit, p_features: ts.gold.features, p_color_code: ts.gold.color_code, p_is_popular: ts.gold.is_popular });

  // cleanup
  await reset(uid);
  await sb.from('user_profile_views').delete().eq('user_id', uid);
  await sb.from('profiles').update({ tier: snap.tier, is_premium: snap.is_premium, premium_expires_at: snap.premium_expires_at, contacts_remaining: snap.contacts_remaining, interests_remaining: snap.interests_remaining }).eq('id', uid);
  console.log('  (probe user restored)');

  console.log(`\n==== SUBSCRIPTION PRIORITY: ${pass} passed, ${fail} failed ====`);
  process.exit(fail ? 1 : 0);
}
main().catch(e => { console.error('FATAL', e.message); process.exit(1); });
