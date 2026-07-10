const fs = require('fs');

const users = [];

for (let i = 1; i <= 500; i++) {
  const gender = i % 2 === 0 ? 'female' : 'male';
  const namePrefix = gender === 'female' ? 'Priya' : 'Rahul';
  
  users.push({
    email: `wedring${i}@gmail.com`,
    password: 'Vino@123',
    creating_for: 'self',
    mother_tongue_id: 1,
    full_name: `${namePrefix} Tester ${i}`,
    gender: gender,
    dob: '1995-05-15',
    height_cm: 165 + (i % 20),
    weight_kg: 60 + (i % 20),
    marital_status: 'never_married',
    physical_status: 'normal',
    about_me: `Hi, I am a test user number ${i}.`,
    religion_id: 1,
    caste_id: 1,
    education_level_id: 1,
    degree: 'B.Tech',
    college_name: 'Test University',
    occupation_id: 1,
    is_working: true,
    annual_income: 500000 + (i * 1000),
    country_id: 1,
    state_id: 1,
    district_id: 1,
    city_id: 1,
    
    // Family
    father_name: 'Test Father',
    mother_name: 'Test Mother',
    family_status: 'middle_class',
    family_type: 'nuclear',
    family_values: 'moderate',
    brothers_count: 1,
    sisters_count: 1,
    
    // Preferences
    min_age: 22,
    max_age: 35,
    min_height_cm: 150,
    max_height_cm: 190,
    
    // Lifestyle
    food_habit: 'vegetarian',
    drinking_habit: 'no',
    smoking_habit: 'no',
    languages: ['Tamil', 'English'],
  });
}

fs.writeFileSync('mock_users.json', JSON.stringify(users, null, 2));
console.log('Successfully generated 500 users in mock_users.json with valid FKs');
