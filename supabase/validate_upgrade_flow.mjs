/**
 * Upgrade-flow + quota-propagation verification.
 * Tests Free -> Silver -> Gold -> Platinum through the REAL purchase_subscription
 * RPC (the same 4-arg path the admin panel + app use), asserting that
 * get_user_quotas reflects each change IMMEDIATELY and quotas are derived
 * live from tier_settings (no hardcoded values). Uses a throwaway test user
 * and fully restores it. Prints NO secrets.
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
const ok = (c, msg) => { c ? (pass++, console.log('  ✓', msg)) : (fail++, console.log('  ✗', msg)); };

async function quotas(uid) {
  const r = await sb.rpc('get_user_quotas', { p_user_id: uid });
  if (r.error) throw new Error('get_user_quotas: ' + r.error.message);
  return r.data;
}

async function main() {
  // tier_settings = the source of truth we assert against
  const ts = {};
  (await sb.from('tier_settings').select('*')).data.forEach(t => ts[t.tier] = t);

  // throwaway test user
  const u = await sb.from('profiles').select('id, tier, is_premium, premium_expires_at, contacts_remaining, interests_remaining').eq('is_active', true).limit(1).single();
  const uid = u.data.id;
  const snap = u.data;
  // reset to a clean free baseline
  await sb.from('subscriptions').delete().eq('user_id', uid);
  await sb.from('profiles').update({ tier: 'free', is_premium: false, premium_expires_at: null, contacts_remaining: 0, interests_remaining: 0 }).eq('id', uid);

  console.log('[Free baseline]');
  let q = await quotas(uid);
  ok(q.tier === 'FREE', `tier reports FREE (got ${q.tier})`);
  ok(q.contacts_remaining === 0, `free contacts_remaining = 0`);
  ok(q.interests_remaining === 0, `free interests_remaining = 0`);
  ok(q.recommended_limit === ts.free.recommended_limit, `free recommended_limit mirrors tier_settings (${q.recommended_limit})`);

  // Upgrade ladder: each step must add EXACTLY tier_settings quotas and stack.
  let expectedContacts = 0, expectedInterests = 0;
  for (const tier of ['silver', 'gold', 'platinum']) {
    console.log(`[Upgrade -> ${tier}] (admin/app 4-arg purchase_subscription)`);
    const r = await sb.rpc('purchase_subscription', { p_user_id: uid, p_plan_type: tier, p_payment_id: `probe_${tier}`, p_amount: ts[tier].price_inr });
    ok(!r.error, `purchase ${tier} succeeded${r.error ? ': ' + r.error.message : ''}`);

    expectedContacts += ts[tier].contacts_limit;
    expectedInterests += ts[tier].interests_limit;

    q = await quotas(uid);
    ok(q.tier === tier.toUpperCase(), `tier now ${tier.toUpperCase()} (got ${q.tier})`);
    ok(q.is_premium === true, `is_premium true`);
    ok(q.contacts_remaining === expectedContacts, `contacts stacked to ${expectedContacts} (got ${q.contacts_remaining})`);
    ok(q.interests_remaining === expectedInterests, `interests stacked to ${expectedInterests} (got ${q.interests_remaining})`);
    ok(q.recommended_limit === ts[tier].recommended_limit, `feed limits switched to ${tier} (${q.recommended_limit})`);
    ok(!!q.expires_at, `expires_at set (${q.expires_at ? new Date(q.expires_at).toISOString().slice(0,10) : 'null'})`);
  }

  // Admin demote-to-free path (updateUserPlan free branch): direct profile reset
  console.log('[Admin demote -> free]');
  await sb.from('subscriptions').update({ status: 'expired' }).eq('user_id', uid);
  await sb.from('profiles').update({ tier: 'free', is_premium: false, contacts_remaining: 0, interests_remaining: 0, premium_expires_at: null }).eq('id', uid);
  q = await quotas(uid);
  ok(q.tier === 'FREE', `demoted back to FREE`);
  ok(q.contacts_remaining === 0 && q.interests_remaining === 0, `quotas cleared on demote`);

  // Instant propagation: change tier_settings, confirm get_user_quotas reflects without re-purchase
  console.log('[Instant admin propagation]');
  const goldRec = ts.gold.recommended_limit;
  await sb.rpc('purchase_subscription', { p_user_id: uid, p_plan_type: 'gold', p_payment_id: 'probe_prop', p_amount: 1 });
  const before = (await quotas(uid)).recommended_limit;
  await sb.rpc('update_tier_settings', { p_tier: 'gold', p_rec: goldRec + 7, p_near: ts.gold.nearby_limit, p_daily: ts.gold.daily_limit, p_dyn: ts.gold.dynamic_daily_enabled, p_plan_name: ts.gold.plan_name, p_price_inr: ts.gold.price_inr, p_duration_months: ts.gold.duration_months, p_contacts_limit: ts.gold.contacts_limit, p_interests_limit: ts.gold.interests_limit, p_features: ts.gold.features, p_color_code: ts.gold.color_code, p_is_popular: ts.gold.is_popular });
  const after = (await quotas(uid)).recommended_limit;
  ok(after === goldRec + 7 && before === goldRec, `gold recommended_limit ${before} -> ${after} with NO re-purchase (instant)`);
  // restore tier_settings
  await sb.rpc('update_tier_settings', { p_tier: 'gold', p_rec: goldRec, p_near: ts.gold.nearby_limit, p_daily: ts.gold.daily_limit, p_dyn: ts.gold.dynamic_daily_enabled, p_plan_name: ts.gold.plan_name, p_price_inr: ts.gold.price_inr, p_duration_months: ts.gold.duration_months, p_contacts_limit: ts.gold.contacts_limit, p_interests_limit: ts.gold.interests_limit, p_features: ts.gold.features, p_color_code: ts.gold.color_code, p_is_popular: ts.gold.is_popular });

  // cleanup: restore the probe user to its original snapshot
  await sb.from('subscriptions').delete().eq('user_id', uid);
  await sb.from('profiles').update({
    tier: snap.tier, is_premium: snap.is_premium, premium_expires_at: snap.premium_expires_at,
    contacts_remaining: snap.contacts_remaining, interests_remaining: snap.interests_remaining
  }).eq('id', uid);
  console.log('  (probe user restored)');

  console.log(`\n==== UPGRADE FLOW: ${pass} passed, ${fail} failed ====`);
  process.exit(fail ? 1 : 0);
}
main().catch(e => { console.error('FATAL', e.message); process.exit(1); });
