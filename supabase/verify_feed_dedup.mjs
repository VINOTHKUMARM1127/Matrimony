/**
 * VERIFY the feed-dedup hotfix AFTER applying supabase/hotfix_feed_dedup.sql.
 *   cd app && node ../supabase/verify_feed_dedup.mjs
 *
 * Read-only except for the normal feed read-path (same writes the app does).
 * Confirms, against the live DB:
 *   1. Recommended + Nearby now return the new is_new_today column.
 *   2. user_profile_views gets a row written for both sections (stable allocation).
 *   3. Repeat calls return the SAME ordered set (no reshuffle = dedup works).
 *   4. The allocation row's profile_ids match what the feed returned.
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

const prem = (await sb.from('profiles').select('id, tier').neq('tier','free').eq('is_active',true).limit(1).single()).data;
console.log('probe user tier =', prem.tier, '\n');

for (const [section, rpc] of [['recommended','get_recommended_profiles'], ['nearby','get_nearby_profiles']]) {
  console.log(`== ${section} ==`);
  const r1 = await sb.rpc(rpc, { p_user_id: prem.id, p_limit: 1000, p_offset: 0 });
  if (r1.error) { ok(false, `${rpc} call: ${r1.error.message}`); continue; }
  ok(r1.data.length === 0 || 'is_new_today' in r1.data[0], 'returns is_new_today column');

  const row = (await sb.from('user_profile_views').select('profile_ids, todays_ids, todays_date')
    .eq('user_id', prem.id).eq('section', section).maybeSingle()).data;
  ok(!!row, 'user_profile_views row exists for section');
  ok(row && row.todays_date === new Date().toISOString().slice(0,10), 'todays_date is today');

  const r2 = await sb.rpc(rpc, { p_user_id: prem.id, p_limit: 1000, p_offset: 0 });
  const ids1 = r1.data.map(x => x.id), ids2 = r2.data.map(x => x.id);
  const same = ids1.length === ids2.length && ids1.every((x,i) => x === ids2[i]);
  ok(same, `repeat call returns identical ordered set (${ids1.length} rows) — no reshuffle`);

  const alloc = row?.profile_ids || [];
  const matches = ids1.every(id => alloc.includes(id));
  ok(matches, 'every returned profile is recorded in the allocation (profile_ids)');
  console.log('');
}

console.log(`==== RESULT: ${pass} passed, ${fail} failed ====`);
process.exit(fail ? 1 : 0);
