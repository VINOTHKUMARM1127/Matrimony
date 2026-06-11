/**
 * Tamil Matrimony — Test Data Generator (Node.js Chunked UPSERT Compiler)
 * Generates 500 demographically accurate Tamil Nadu mock profiles, horoscope data,
 * partner expectations, mock auth profiles, premium subscriptions, and mutual interactions,
 * using ON CONFLICT (id) DO UPDATE statements to overwrite any empty profiles auto-created
 * by database triggers on auth signup.
 */

const fs = require('fs');
const path = require('path');

// 1. Dictionaries for realistic data generation
const MALE_NAMES = [
  'Karthik', 'Suresh', 'Vignesh', 'Aravind', 'Ramesh', 'Prakash', 'Bala', 'Anbarasan', 'Murugan', 'Muthu',
  'Senthil', 'Saravanan', 'Dinesh', 'Vinoth', 'Prabhu', 'Rajesh', 'Selvam', 'Manikandan', 'Vijay', 'Ajith',
  'Surya', 'Siva', 'Ganesan', 'Hari', 'Shankar', 'Vetrivel', 'Kabilan', 'Elango', 'Arun', 'Ranjith',
  'Jeeva', 'Deepak', 'Gautham', 'Siddharth', 'Madhavan', 'Jayakumar', 'Naveen', 'Praveen', 'Sathish', 'Mohan',
  'Srinivasan', 'Sundar', 'Viswanathan', 'Anand', 'Kannan', 'Ramakrishnan', 'Sakthi', 'Velmurugan', 'Thirumal', 'Chinnasamy'
];

const FEMALE_NAMES = [
  'Anitha', 'Divya', 'Priya', 'Kavitha', 'Soundarya', 'Janani', 'Sneha', 'Keerthana', 'Megala', 'Nandhini',
  'Ramya', 'Preethi', 'Sowmya', 'Swetha', 'Meenakshi', 'Abirami', 'Gayathri', 'Shalini', 'Archana', 'Sandhya',
  'Malarvizhi', 'Kayalvizhi', 'Ponmani', 'Yazhini', 'Oviya', 'Dharshini', 'Harini', 'Nivedha', 'Pavithra', 'Pooja',
  'Ramani', 'Deepa', 'Banumathi', 'Rajeshwari', 'Lakshmi', 'Uma', 'Gowri', 'Parvathi', 'Saraswathi', 'Vidya',
  'Rekha', 'Chitra', 'Vanitha', 'Geetha', 'Kokila', 'Shanthi', 'Radha', 'Malathi', 'Vijaya', 'Indhumathi'
];

const SURNAMES = [
  'Kumar', 'Raj', 'Sundaram', 'Selvan', 'Lingam', 'Nathan', 'Pandian', 'Devan', 'Velan', 'Murthy',
  'Krishnan', 'Raman', 'Swamy', 'Shankar', 'Moorthy', 'Balan', 'Samy', 'Gopal', 'Naicker', 'Mani'
];

const DISTRICTS_CITIES = [
  { district: 'Chennai', city: 'Chennai' },
  { district: 'Coimbatore', city: 'Coimbatore' },
  { district: 'Madurai', city: 'Madurai' },
  { district: 'Trichy', city: 'Tiruchirappalli' },
  { district: 'Salem', city: 'Salem' },
  { district: 'Tirunelveli', city: 'Tirunelveli' },
  { district: 'Erode', city: 'Erode' },
  { district: 'Vellore', city: 'Vellore' },
  { district: 'Thanjavur', city: 'Thanjavur' },
  { district: 'Tuticorin', city: 'Thoothukudi' },
  { district: 'Kanchipuram', city: 'Kanchipuram' },
  { district: 'Tiruppur', city: 'Tiruppur' }
];

const CASTES = {
  Hindu: [
    'Adi Dravida', 'Gounder', 'Nadar', 'Vanniyar', 'Vellalar', 'Mudaliar', 'Chettiar', 'Naidu',
    'Brahmin - Iyer', 'Brahmin - Iyengar', 'Pillai', 'Devendra Kula Vellalar', 'Vishwakarma',
    'Agamudayar', 'Sengunthar', 'Yadav', 'Naicker', 'Thevar', 'Arunthathiyar', 'Kallar', 'Maravar'
  ],
  Christian: ['RC Christian', 'Protestant Christian', 'Pentecostal', 'CSI Christian', 'Nadar Christian', 'Vellalar Christian'],
  Muslim: ['Sunni Muslim', 'Shia Muslim', 'Rawther', 'Marakayar', 'Labbai']
};

const STARS = [
  'Ashwini', 'Bharani', 'Krittika', 'Rohini', 'Mirgashira', 'Arudra', 'Punarvasu', 'Pushya', 'Aslesha',
  'Magha', 'Poorvaphalguni', 'Uttaraphalguni', 'Hasta', 'Chitra', 'Swati', 'Vishakha', 'Anuradha', 'Jyeshta',
  'Moola', 'Poorvashadha', 'Uttarachadha', 'Shravana', 'Dhanishta', 'Shatabhisha', 'Poorvabhadrapada', 'Uttarabhadrapada', 'Revati'
];

const RAASIS = [
  'Mesham', 'Rishabam', 'Mithunam', 'Kadagam', 'Simham', 'Kanni', 'Thulaam', 'Viruchigam', 'Dhanusu', 'Magaram', 'Kumbam', 'Meenam'
];

const GOTHRAMS = [
  'Siva', 'Vishnu', 'Murugan', 'Bharadwaj', 'Kasyapa', 'Vashishta', 'Agastya', 'Viswamitra', 'Gautama', 'Atri', 'Angirasa', 'Harita'
];

const OCCUPATIONS = [
  'Software Engineer', 'Mechanical Engineer', 'Civil Engineer', 'Doctor', 'Dentist', 'School Teacher',
  'College Professor', 'Business Owner', 'Auditor', 'Bank Manager', 'Government Officer', 'HR Specialist',
  'Architect', 'Pharmacist', 'Police Officer', 'Advocate'
];

const EDUCATION_LEVELS = [
  'B.E. / B.Tech', 'M.B.B.S', 'M.B.A', 'M.C.A', 'B.Sc', 'M.Sc', 'Ph.D', 'B.Com', 'M.Com', 'B.A', 'M.A', 'B.Ed'
];

const INCOME_RANGES = [
  '₹3 Lakhs - ₹5 Lakhs', '₹5 Lakhs - ₹7 Lakhs', '₹7 Lakhs - ₹10 Lakhs', '₹10 Lakhs - ₹15 Lakhs', '₹15 Lakhs - ₹20 Lakhs', '₹20 Lakhs+'
];

const COMPANIES = [
  'TCS', 'Infosys', 'Cognizant', 'Wipro', 'Zoho', 'HCL', 'Accenture', 'Government Service', 'Private Practice', 'Self Employed'
];

const pickRandom = (arr) => arr[Math.floor(Math.random() * arr.length)];
const randomRange = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;
const generateUUID = (index) => {
  const hex = index.toString(16).padStart(12, '0');
  return `00000000-0000-4000-a000-${hex}`;
};

const generateTestData = () => {
  const users = [];
  const totalProfiles = 500;

  for (let i = 1; i <= totalProfiles; i++) {
    const id = generateUUID(i);
    const gender = i % 2 === 0 ? 'female' : 'male';
    const firstName = gender === 'male' ? pickRandom(MALE_NAMES) : pickRandom(FEMALE_NAMES);
    const lastName = pickRandom(SURNAMES);
    const display_name = `${firstName} ${lastName}`;
    
    const age = randomRange(21, 38);
    const birthYear = new Date().getFullYear() - age;
    const dob = `${birthYear}-${String(randomRange(1, 12)).padStart(2, '0')}-${String(randomRange(1, 28)).padStart(2, '0')}`;
    
    const height_cm = gender === 'male' ? randomRange(162, 188) : randomRange(150, 175);
    
    const religionRand = Math.random();
    const religion = religionRand < 0.85 ? 'Hindu' : religionRand < 0.93 ? 'Christian' : 'Muslim';
    const casteList = CASTES[religion];
    const caste = pickRandom(casteList);
    const subcaste = Math.random() > 0.4 ? `${caste} subcaste` : null;

    const cityObj = pickRandom(DISTRICTS_CITIES);
    const education = pickRandom(EDUCATION_LEVELS);
    const occupation = pickRandom(OCCUPATIONS);
    const annual_income = pickRandom(INCOME_RANGES);
    const company = pickRandom(COMPANIES);

    const about_me = `Hi, I am ${firstName}. I have completed my ${education} and am currently working as a ${occupation} at ${company} in ${cityObj.city}. I value family traditions and seek a supportive partner to embark on life's journey together.`;

    const is_verified = Math.random() > 0.3;
    const is_premium = Math.random() > 0.75;

    users.push({
      index: i,
      id,
      display_name,
      gender,
      dob,
      height_cm,
      marital_status: Math.random() > 0.85 ? 'divorced' : 'never_married',
      religion,
      caste,
      subcaste,
      dosham: Math.random() > 0.8 ? 'yes' : 'no',
      education,
      education_detail: `${education} Graduate`,
      occupation,
      occupation_detail: `${occupation} Details`,
      annual_income,
      company_name: company,
      city: cityObj.city,
      district: cityObj.district,
      about_me,
      family_type: Math.random() > 0.3 ? 'nuclear' : 'joint',
      family_status: pickRandom(['middle_class', 'upper_middle_class', 'rich']),
      father_occupation: 'Retired Employee',
      mother_occupation: 'Homemaker',
      is_verified,
      is_premium,
      star: pickRandom(STARS),
      raasi: pickRandom(RAASIS),
      lagnam: pickRandom(RAASIS),
      gothram: pickRandom(GOTHRAMS),
      manglik: Math.random() > 0.85 ? 'yes' : 'no',
    });
  }
  return users;
};

// SQL string escaping helper function
const escapeSQL = (str) => {
  if (str === null || str === undefined) return 'NULL';
  return `'${str.replace(/'/g, "''")}'`;
};

const buildChunkSQL = (usersSubset, isFirstChunk = false, isLastChunk = false, chunkIndex = 1) => {
  let sql = `-- ============================================================
-- Tamil Matrimony — Seeding Ecosystem (Part ${chunkIndex})
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

`;

  if (isFirstChunk) {
    sql += `-- CLEAN existing seed records to avoid conflicts\n`;
    sql += `DELETE FROM public.user_activity WHERE activity_type = 'view_phone';\n`;
    sql += `DELETE FROM public.interests WHERE message LIKE '%connect%';\n`;
    sql += `DELETE FROM public.subscriptions WHERE razorpay_payment_id LIKE 'pay_mock_%';\n`;
    sql += `DELETE FROM public.photos WHERE storage_path LIKE '%randomuser.me%';\n`;
    sql += `DELETE FROM public.horoscope_details WHERE gothram IN ('Siva', 'Vishnu', 'Murugan', 'Bharadwaj', 'Kasyapa', 'Vashishta', 'Agastya', 'Viswamitra', 'Gautama', 'Atri', 'Angirasa', 'Harita');\n`;
    sql += `DELETE FROM public.partner_preferences WHERE user_id IN (SELECT id FROM public.profiles WHERE display_name LIKE '%Kumar%' OR display_name LIKE '%Raj%' OR display_name LIKE '%Sundaram%' OR display_name LIKE '%Selvan%');\n`;
    sql += `DELETE FROM public.profiles WHERE profile_id LIKE 'TM%';\n\n`;
  }

  // 1. auth.users
  sql += `-- 1. AUTH USERS INSERTIONS\n`;
  usersSubset.forEach((u) => {
    const escapedDisplayName = u.display_name.replace(/'/g, "''");
    sql += `INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('${u.id}', 'tamiluser${u.index}@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"${escapedDisplayName}"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;\n`;
  });

  // 2. public.profiles - CRITICAL FIX: Use ON CONFLICT (id) DO UPDATE to overwrite basic profiles created by handle_new_user() trigger
  sql += `\n-- 2. PUBLIC PROFILES INSERTIONS\n`;
  usersSubset.forEach((u) => {
    const profileId = `TM${String(u.index).padStart(6, '0')}`;
    sql += `INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('${u.id}', '${profileId}', ${escapeSQL(u.display_name)}, '${u.gender}', '${u.dob}', ${u.height_cm}, '${u.marital_status}', '${u.religion}', ${escapeSQL(u.caste)}, ${u.subcaste ? escapeSQL(u.subcaste) : 'NULL'}, '${u.dosham}', ${escapeSQL(u.education)}, ${escapeSQL(u.education_detail)}, ${escapeSQL(u.occupation)}, ${escapeSQL(u.occupation_detail)}, ${escapeSQL(u.annual_income)}, ${escapeSQL(u.company_name)}, ${escapeSQL(u.city)}, ${escapeSQL(u.district)}, ${escapeSQL(u.about_me)}, '${u.family_type}', '${u.family_status}', ${escapeSQL(u.father_occupation)}, ${escapeSQL(u.mother_occupation)}, ${u.is_verified}, ${u.is_premium}, true, 100, NOW() - INTERVAL '${randomRange(0, 10)} days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;\n`;
  });

  // 3. public.horoscope_details
  sql += `\n-- 3. HOROSCOPE DETAILS INSERTIONS\n`;
  usersSubset.forEach((u) => {
    sql += `INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('${u.id}', '${u.star}', '${u.raasi}', '${u.lagnam}', '${u.gothram}', '${u.manglik}')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;\n`;
  });

  // 4. public.partner_preferences
  sql += `\n-- 4. PARTNER PREFERENCES INSERTIONS\n`;
  usersSubset.forEach((u) => {
    const ageMin = Math.max(18, randomRange(21, 28));
    const ageMax = randomRange(30, 45);
    const heightMin = u.height_cm - 15;
    const heightMax = u.height_cm;

    sql += `INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('${u.id}', ${ageMin}, ${ageMax}, ${heightMin}, ${heightMax}, ARRAY['never_married']::TEXT[], ARRAY['${u.religion}']::TEXT[], ARRAY[${escapeSQL(u.caste)}, 'Caste No Bar']::TEXT[], ARRAY[${escapeSQL(u.education)}, 'No Education Bar']::TEXT[], ARRAY[${escapeSQL(u.occupation)}]::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;\n`;
  });

  // 5. public.photos
  sql += `\n-- 5. PHOTOS INSERTIONS (Lightweight URL)\n`;
  usersSubset.forEach((u) => {
    const portraitId = (u.index % 99) + 1;
    const photoUrl = `https://randomuser.me/api/portraits/${u.gender === 'male' ? 'men' : 'women'}/${portraitId}.jpg`;
    sql += `INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('${u.id}', '${photoUrl}', '${photoUrl}', true, true)
ON CONFLICT (id) DO NOTHING;\n`;
  });

  // 6. Subscriptions, Interactions, and Admin data in the final chunk
  if (isLastChunk) {
    sql += `\n-- 6. SUBSCRIPTIONS INSERTIONS\n`;
    let premiumCount = 0;
    usersSubset.forEach((u) => {
      if (u.is_premium) {
        premiumCount++;
        const plan = pickRandom(['gold', 'prime_gold', 'till_u_marry']);
        const price = plan === 'gold' ? 499 : plan === 'prime_gold' ? 999 : 2499;
        const months = plan === 'till_u_marry' ? 6 : 1;

        sql += `INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('${u.id}', '${plan}', 'pay_mock_${Date.now()}_${premiumCount}', 'active', ${price}, NOW() - INTERVAL '5 days', NOW() + INTERVAL '${months} month')
ON CONFLICT (id) DO NOTHING;\n`;
      }
    });

    sql += `\n-- 7. MUTUAL INTERESTS INSERTIONS\n`;
    const males = usersSubset.filter((u) => u.gender === 'male');
    const females = usersSubset.filter((u) => u.gender === 'female');
    
    for (let j = 0; j < 60; j++) {
      if (males.length && females.length) {
        const sender = pickRandom(males);
        const receiver = pickRandom(females);
        sql += `INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('${sender.id}', '${receiver.id}', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;\n`;
      }
    }

    sql += `\n-- 8. MOCK COMPLETED REPORTS\n`;
    for (let r = 0; r < 10; r++) {
      if (males.length && females.length) {
        const reporter = pickRandom(males);
        const reported = pickRandom(females);
        sql += `INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('${reporter.id}', '${reported.id}', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;\n`;
      }
    }
  }

  sql += `\nCOMMIT;\n`;
  return sql;
};

// Compile and write chunked SQL files
const compileSQL = () => {
  const users = generateTestData();
  console.log('Compiling 500 mock users into chunked SQL files with UPSERT updates...');

  // Chunking boundaries
  const chunk1Users = users.slice(0, 170); // 170 users
  const chunk2Users = users.slice(170, 340); // 170 users
  const chunk3Users = users.slice(340, 500); // 160 users + subscriptions, interests, and reports

  // Generate Part 1
  const sqlPart1 = buildChunkSQL(chunk1Users, true, false, 1);
  fs.writeFileSync(path.join(__dirname, 'seed_part1.sql'), sqlPart1, 'utf8');
  console.log('Part 1 Compiled: seed_part1.sql (~450KB)');

  // Generate Part 2
  const sqlPart2 = buildChunkSQL(chunk2Users, false, false, 2);
  fs.writeFileSync(path.join(__dirname, 'seed_part2.sql'), sqlPart2, 'utf8');
  console.log('Part 2 Compiled: seed_part2.sql (~440KB)');

  // Generate Part 3
  const sqlPart3 = buildChunkSQL(chunk3Users, false, true, 3);
  fs.writeFileSync(path.join(__dirname, 'seed_part3.sql'), sqlPart3, 'utf8');
  console.log('Part 3 Compiled: seed_part3.sql (~480KB)');

  console.log('\nAll 3 Seeding Parts generated successfully! Paste them sequentially in Supabase dashboard.');
};

compileSQL();
