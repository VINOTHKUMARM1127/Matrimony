const fs = require('fs');

async function testEdgeFunction() {
  const users = JSON.parse(fs.readFileSync('mock_users.json', 'utf8'));
  const user = users[0];

  const payload = {
    action: 'create_full_user',
    auth: { email: user.email, password: user.password, email_confirm: true },
    meta: { creating_for: user.creating_for || 'self', mother_tongue_id: user.mother_tongue_id || null },
    profile: {
      full_name: user.full_name,
      gender: user.gender,
      dob: user.dob,
      height_cm: user.height_cm,
      weight_kg: user.weight_kg,
      marital_status: user.marital_status,
      physical_status: user.physical_status,
      about_me: user.about_me,
      degree: user.degree,
      college_name: user.college_name,
      is_working: user.is_working,
      annual_income: user.annual_income
    },
    family: {
      father_name: user.father_name,
      mother_name: user.mother_name,
      family_status: user.family_status,
      family_type: user.family_type,
      family_values: user.family_values,
      brothers_count: user.brothers_count,
      sisters_count: user.sisters_count
    },
    lifestyle: {
      food_habit: user.food_habit,
      drinking_habit: user.drinking_habit,
      smoking_habit: user.smoking_habit,
      languages: user.languages
    },
    preferences: {
      min_age: user.min_age,
      max_age: user.max_age,
      min_height_cm: user.min_height_cm,
      max_height_cm: user.max_height_cm
    }
  };

  try {
    const res = await fetch('https://pcdtgwelrwyvtqixqufc.supabase.co/functions/v1/admin-users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBjZHRnd2Vscnd5dnRxaXhxdWZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk0OTk1MzEsImV4cCI6MjA5NTA3NTUzMX0.ZNMBSNUAy0rl185XgqA7iFGTzh8tTdiEl0-jvoGeyLA'
      },
      body: JSON.stringify(payload)
    });

    const status = res.status;
    const text = await res.text();
    console.log('Status:', status);
    console.log('Response:', text);
  } catch (err) {
    console.error('Fetch error:', err);
  }
}

testEdgeFunction();
