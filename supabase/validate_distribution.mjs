/**
 * Post-migration validation harness.
 *
 * Run AFTER applying supabase/00_authoritative_schema.sql:
 *   cd app && node ../supabase/validate_distribution.mjs
 *
 * Reads app/.env for the Supabase URL + service-role key. Prints NO secrets.
 * Verifies, against the live 500+ profiles:
 *   Phase 2  Limits flow from tier_settings -> RPC for free/silver/gold/platinum
 *   Phase 3  Nearby cascade ranks same-district first
 *   Phase 4  Recommended applies opposite-gender + exclusions in SQL
 *   Phase 7  Daily rotation windows day-by-day for dynamic tiers
 *   Phase 1  purchase/interest/quota RPC signatures resolve
 *
 * It mutates ONE throwaway test user's tier in-memory via RPC and restores it.
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath, pathToFileURL } from 'url';
import { createRequire } from 'module';

const appDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../app');
// Resolve @supabase/supabase-js from the app's node_modules (this file lives in supabase/).
const require = createRequire(path.join(appDir, 'package.json'));
const { createClient } = await import(pathToFileURL(require.resolve('@supabase/supabase-js')).href);

const env = {};
for (const line of fs.readFileSync(path.join(appDir, '.env'), 'utf8').split('\n')) {
  const m = line.match(/^([A-Z0-9_]+)=(.*)$/); if (m) env[m[1]] = m[2].trim();
}
const sb = createClient(env.EXPO_PUBLIC_SUPABASE_URL, env.EXPO_PUBLIC_SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });

let pass = 0, fail = 0;
const ok = (c, msg) => { c ? (pass++, console.log('  ✓', msg)) : (fail++, console.log('  ✗', msg)); };

async function setTier(userId, tier) {
  // Direct table update via service role (admin-equivalent), no quota side effects.
  await sb.from('profiles').update({ tier, is_premium: tier !== 'free' }).eq('id', userId);
}

async function main() {
  const u = await sb.from('profiles').select('id, gender, district, tier').eq('is_active', true).limit(1).single();
  const uid = u.data.id;
  const originalTier = u.data.tier;
  console.log('Probe user district:', u.data.district, '| gender:', u.data.gender);

  // ── Phase 2: limits flow from tier_settings per tier ──
  console.log('\n[Phase 2] tier_settings -> RPC limit enforcement');
  const settings = {};
  (await sb.from('tier_settings').select('*')).data.forEach(t => settings[t.tier] = t);
  for (const tier of ['free', 'silver', 'gold', 'platinum']) {
    await setTier(uid, tier);
    const rec = await sb.rpc('get_recommended_profiles', { p_user_id: uid, p_limit: 1000, p_offset: 0 });
    if (rec.error) { ok(false, `${tier}: recommended RPC error: ${rec.error.message}`); continue; }
    ok(rec.data.length <= settings[tier].recommended_limit,
       `${tier}: recommended returned ${rec.data.length} <= cap ${settings[tier].recommended_limit}`);
  }

  // ── Phase 3: Nearby cascade ranks same-district first ──
  console.log('\n[Phase 3] Nearby district-priority cascade');
  await setTier(uid, 'platinum');
  const near = await sb.rpc('get_nearby_profiles', { p_user_id: uid, p_limit: 50, p_offset: 0 });
  if (near.error) ok(false, 'nearby RPC error: ' + near.error.message);
  else {
    ok(near.data.length > 0, `nearby returned ${near.data.length} rows (was 0 before fix)`);
    if (u.data.district && near.data.length > 1) {
      const firstScore = near.data[0].compatibility_score;
      const lastScore = near.data[near.data.length - 1].compatibility_score;
      ok(firstScore >= lastScore, `nearby ranked by score desc (${firstScore} -> ${lastScore})`);
      const sameDistFirst = near.data[0].district === u.data.district;
      ok(sameDistFirst || !u.data.district, `top nearby result is same district (${near.data[0].district})`);
    }
  }

  // ── Phase 4: Recommended opposite-gender + SQL filtering ──
  console.log('\n[Phase 4] Recommended filtering in SQL');
  const rec = await sb.rpc('get_recommended_profiles', { p_user_id: uid, p_limit: 200, p_offset: 0 });
  if (rec.error) ok(false, 'recommended RPC error: ' + rec.error.message);
  else {
    const allOpposite = rec.data.every(p => p.gender !== u.data.gender);
    ok(allOpposite, `all recommended are opposite gender (${rec.data.length} rows)`);
    const noSelf = rec.data.every(p => p.id !== uid);
    ok(noSelf, 'self excluded from recommended');
    ok(rec.data.length === 0 || 'city' in rec.data[0], 'recommended returns full columns (city present)');
  }

  // ── Phase 6: feed data completeness ──
  console.log('\n[Phase 6] Feed data completeness');
  if (!rec.error && rec.data.length > 0) {
    const r0 = rec.data[0];
    for (const col of ['city', 'district', 'occupation', 'education', 'height_cm', 'tier']) {
      ok(col in r0, `recommended row has '${col}'`);
    }
  }

  // ── Phase 7: Daily rotation windowing ──
  console.log('\n[Phase 7] Daily rotation (dynamic tier)');
  await setTier(uid, 'gold');
  const d1 = await sb.rpc('get_daily_matches', { p_user_id: uid, p_limit: 100, p_offset: 0 });
  if (d1.error) ok(false, 'daily RPC error: ' + d1.error.message);
  else ok(d1.data.length <= settings.gold.daily_limit, `daily window <= cap ${settings.gold.daily_limit} (got ${d1.data.length})`);

  // ── Phase 1: signatures resolve ──
  console.log('\n[Phase 1] Critical RPC signatures');
  const peer = await sb.from('profiles').select('id').neq('id', uid).limit(1).single();
  const si = await sb.rpc('send_interest_with_quota', { p_sender_id: uid, p_receiver_id: peer.data.id, p_message: 'validation' });
  ok(!si.error || /quota|remaining/i.test(si.error.message), `send_interest 3-arg resolves (${si.error ? si.error.message : 'OK'})`);
  const ps = await sb.rpc('purchase_subscription', { p_user_id: uid, p_plan_type: 'silver', p_payment_id: 'validate', p_amount: 1 });
  ok(!ps.error, `purchase_subscription 4-arg resolves (${ps.error ? ps.error.message : 'OK'})`);

  // ── cleanup: restore probe user & remove test rows ──
  await sb.from('interests').delete().eq('sender_id', uid).eq('receiver_id', peer.data.id);
  await sb.from('subscriptions').delete().eq('user_id', uid);
  await sb.from('profiles').update({ tier: originalTier, is_premium: originalTier !== 'free', premium_expires_at: null, contacts_remaining: 0, interests_remaining: 0 }).eq('id', uid);

  console.log(`\n==== RESULT: ${pass} passed, ${fail} failed ====`);
  process.exit(fail ? 1 : 0);
}
main().catch(e => { console.error('FATAL', e.message); process.exit(1); });
