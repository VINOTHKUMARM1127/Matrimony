/**
 * FULL REGISTRATION VALIDATION — simulates all 8 steps as a real authenticated
 * user (anon key + JWT, exactly like the mobile app), writing EVERY field group,
 * then verifies persistence after a fresh re-login. Asserts:
 *   - no "permission denied" (grants OK)
 *   - no "could not find column" (schema OK)
 *   - profiles / horoscope_details / partner_preferences / photos all persist
 *   - completeness % computes
 * Uses a throwaway user and deletes it. Prints NO secrets.
 *
 * Run: cd app && node ../supabase/validate_registration.mjs
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
const URL = env.EXPO_PUBLIC_SUPABASE_URL, ANON = env.EXPO_PUBLIC_SUPABASE_ANON_KEY, SVC = env.EXPO_PUBLIC_SUPABASE_SERVICE_ROLE_KEY;
const admin = createClient(URL, SVC, { auth: { persistSession: false } });

let pass = 0, fail = 0;
const ok = (c, m) => { c ? (pass++, console.log('  ✓', m)) : (fail++, console.log('  ✗', m)); };

async function main() {
  const email = `reg_test_${Date.now()}@example.com`;
  const pw = 'RegTest123!';
  const created = await admin.auth.admin.createUser({ email, password: pw, email_confirm: true });
  if (created.error) { console.log('createUser ERR', created.error.message); process.exit(1); }
  const uid = created.data.user.id;
  console.log('test user:', uid.slice(0, 8), '…');

  const app = createClient(URL, ANON, { auth: { persistSession: false } });
  await app.auth.signInWithPassword({ email, password: pw });

  // Step 1-2-3-4-6-7: profiles upsert (everything that lives on profiles)
  console.log('\n[Steps 1-7] profiles upsert (all columns)');
  const profilePayload = {
    id: uid, display_name: 'Test Kumar', gender: 'male', date_of_birth: '1994-08-20',
    height_cm: 175, marital_status: 'never_married', mother_tongue: 'Tamil',
    religion: 'Hindu', caste: 'Mudaliar', subcaste: 'Arcot', dosham: 'no',
    family_type: 'nuclear', family_status: 'upper_middle_class',
    father_occupation: 'Government Employee', mother_occupation: 'Homemaker',
    brothers_count: 1, brothers_married: 1, sisters_count: 0, sisters_married: 0,
    city: 'Chennai', district: 'Chennai', state: 'Tamil Nadu', about_me: 'Hello.',
    education: 'B.E. / B.Tech.', education_detail: 'CSE', occupation: 'Software Engineer',
    occupation_detail: 'Backend', company_name: 'TechCorp', annual_income: '10-15 Lakhs',
    food_habit: 'vegetarian', smoking: 'no', drinking: 'no',
    languages_known: ['Tamil', 'English'], interests: ['Cricket'], hobbies: ['Reading'],
  };
  const up = await app.from('profiles').upsert(profilePayload, { onConflict: 'id' }).select().single();
  ok(!up.error, `profiles upsert (${up.error ? up.error.message : 'OK, ' + Object.keys(up.data).length + ' cols'})`);

  // Step 5: horoscope
  console.log('\n[Step 5] horoscope_details upsert');
  const ho = await app.from('horoscope_details').upsert({
    user_id: uid, star: 'Ashwini', raasi: 'Mesham', lagnam: 'Simmam', gothram: 'Bharadwaja', dasa_balance: 'Venus 3y'
  }, { onConflict: 'user_id' }).select().single();
  ok(!ho.error, `horoscope upsert (${ho.error ? ho.error.message : 'OK'})`);

  // Step 8: partner preferences (arrays + height range + food + star)
  console.log('\n[Step 8] partner_preferences upsert');
  const pp = await app.from('partner_preferences').upsert({
    user_id: uid, age_min: 24, age_max: 30, height_min: 150, height_max: 170,
    marital_status: ['never_married'], religion: ['Hindu'], caste: ['Mudaliar'],
    education: ['B.E. / B.Tech.'], occupation: ['Software Engineer'],
    food_habit: ['vegetarian'], star: ['Ashwini', 'Bharani']
  }, { onConflict: 'user_id' }).select().single();
  ok(!pp.error, `partner_preferences upsert (${pp.error ? pp.error.message : 'OK'})`);

  // Photos
  console.log('\n[Photos] insert');
  const ph = await app.from('photos').insert({
    user_id: uid, storage_path: 'https://cdn/x.jpg', thumbnail_path: 'https://cdn/x.jpg', is_primary: true, display_order: 0
  }).select().single();
  ok(!ph.error, `photos insert (${ph.error ? ph.error.message : 'OK'})`);

  // Completion update
  console.log('\n[Completion] profiles update');
  const cu = await app.from('profiles').update({ is_profile_complete: true, profile_completion_percent: 100 }).eq('id', uid).select().single();
  ok(!cu.error, `completion update (${cu.error ? cu.error.message : 'OK'})`);

  // Persistence after fresh re-login
  console.log('\n[Persistence] re-login and read back');
  const app2 = createClient(URL, ANON, { auth: { persistSession: false } });
  await app2.auth.signInWithPassword({ email, password: pw });
  const read = await app2.from('profiles').select('*, photos(*), partner_preferences(*), horoscope_details(*)').eq('id', uid).single();
  if (read.error) ok(false, 'readback: ' + read.error.message);
  else {
    ok(read.data.father_occupation === 'Government Employee', 'father_occupation persisted');
    ok(Array.isArray(read.data.languages_known) && read.data.languages_known.includes('Tamil'), 'languages_known persisted');
    ok(read.data.interests?.includes('Cricket'), 'interests persisted');
    ok(read.data.horoscope_details?.star === 'Ashwini', 'horoscope persisted');
    ok(Array.isArray(read.data.partner_preferences?.food_habit) && read.data.partner_preferences.food_habit.includes('vegetarian'), 'pref food_habit persisted');
    ok(read.data.partner_preferences?.star?.includes('Ashwini'), 'pref star persisted');
    ok((read.data.photos || []).length === 1, 'photo persisted');
    ok(read.data.profile_completion_percent === 100, 'completion persisted');
  }

  // Completeness engine sanity (mirror of app util)
  console.log('\n[Completeness] engine computes');
  const compMod = await import(pathToFileURL(path.join(appDir, 'src/utils/profileCompleteness.js')).href);
  const comp = compMod.computeCompleteness(read.data || {}, {
    horoscope: read.data?.horoscope_details, preferences: read.data?.partner_preferences, photos: read.data?.photos,
  });
  ok(comp.percent >= 90, `completeness engine -> ${comp.percent}% (missing: ${comp.missingSections.join(', ') || 'none'})`);

  // cleanup
  await admin.auth.admin.deleteUser(uid);
  console.log('\ntest user deleted');
  console.log(`\n==== REGISTRATION: ${pass} passed, ${fail} failed ====`);
  process.exit(fail ? 1 : 0);
}
main().catch(e => { console.error('FATAL', e.message); process.exit(1); });
