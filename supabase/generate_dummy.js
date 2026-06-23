const fs = require('fs');

const generateData = () => {
  const users = [];
  
  const maleNames = ['Arun', 'Karthik', 'Vijay', 'Prakash', 'Ramesh', 'Suresh', 'Manoj', 'Deepak', 'Sathish', 'Rajesh', 'Ganesh', 'Prabu', 'Vignesh', 'Dinesh', 'Ashok'];
  const femaleNames = ['Priya', 'Kavitha', 'Meena', 'Divya', 'Deepa', 'Anitha', 'Sangeetha', 'Nithya', 'Ramya', 'Swathi', 'Revathi', 'Gowri', 'Sujatha', 'Radha', 'Karthika'];
  const lastNames = ['Kumar', 'Raj', 'Prakash', 'Krishnan', 'Natarajan', 'Subramanian', 'Raman', 'Srinivasan', 'Raju', 'Chandran', 'Murugan'];
  
  const cities = ['Coimbatore', 'Erode', 'Tiruppur', 'Salem', 'Chennai', 'Madurai', 'Trichy', 'Namakkal', 'Karur', 'Dharmapuri'];
  const educations = ['B.E', 'B.Tech', 'MBA', 'B.Sc', 'M.Sc', 'MCA', 'MBBS', 'CA'];
  const occupations = ['Software Engineer', 'Teacher', 'Doctor', 'Accountant', 'Business Owner', 'Mechanical Engineer', 'Civil Engineer', 'Government Employee', 'Nurse', 'Designer'];
  
  const religions = [
    ...Array(70).fill('Hindu'),
    ...Array(15).fill('Christian'),
    ...Array(15).fill('Muslim')
  ];

  const maritalStatuses = [
    ...Array(90).fill('Never Married'),
    ...Array(8).fill('Divorced'),
    ...Array(2).fill('Widowed')
  ];

  const castes = ['Gounder', 'Vanniyar', 'Thevar', 'Nadar', 'Chettiar', 'Mudaliar', 'Pillai', 'Naidu', 'Brahmin', 'Any'];
  const rasis = ['Mesham', 'Rishabam', 'Midhunam', 'Kadagam', 'Simmam', 'Kanni', 'Thulam', 'Viruchigam', 'Dhanusu', 'Makaram', 'Kumbam', 'Meenam'];
  const nakshatras = ['Ashwini', 'Bharani', 'Karthigai', 'Rohini', 'Mirugasiridam', 'Thiruvathirai', 'Punarpoosam', 'Poosam', 'Ayilyam', 'Magam', 'Pooram', 'Uthiram'];

  const getRandomInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;
  const getRandomElement = (arr) => arr[Math.floor(Math.random() * arr.length)];
  const getRandomElements = (arr, num) => {
    const shuffled = [...arr].sort(() => 0.5 - Math.random());
    return shuffled.slice(0, num);
  };

  for (let i = 1; i <= 500; i++) {
    const isMale = i <= 250;
    const gender = isMale ? 'Male' : 'Female';
    const firstName = isMale ? getRandomElement(maleNames) : getRandomElement(femaleNames);
    const lastName = getRandomElement(lastNames);
    const name = `${firstName} ${lastName}`;
    
    const email = `${firstName.toLowerCase()}.${lastName.toLowerCase()}${i}@example.com`;
    const phone = `9${Math.floor(Math.random() * 900000000 + 100000000)}`;

    const age = getRandomInt(21, 35);
    const birthYear = 2026 - age;
    const birthMonth = String(getRandomInt(1, 12)).padStart(2, '0');
    const birthDay = String(getRandomInt(1, 28)).padStart(2, '0');
    const dob = `${birthYear}-${birthMonth}-${birthDay}`;

    const heightCm = isMale ? getRandomInt(160, 185) : getRandomInt(150, 175);
    const religion = getRandomElement(religions);
    const caste = getRandomElement(castes);
    const maritalStatus = getRandomElement(maritalStatuses);

    const income = `${getRandomInt(2, 20)} LPA`;
    const edu = getRandomElement(educations);
    const occ = getRandomElement(occupations);
    const city = getRandomElement(cities);

    // FLATTENED USER FORMAT FOR ADMIN BULK UPLOADER
    const userObj = {
      email,
      password: "User@123!",
      name,
      gender,
      date_of_birth: dob,
      phone,
      height_cm: heightCm,
      marital_status: maritalStatus,
      mother_tongue: "Tamil",
      religion,
      caste,
      dosham: getRandomElement(["No", "Yes", "Don't Know"]),
      highest_qualification: edu,
      occupation: occ,
      annual_income: income,
      family_type: getRandomElement(["Nuclear", "Joint"]),
      family_status: getRandomElement(["Middle Class", "Upper Middle Class", "Rich"]),
      father_occupation: "Business",
      mother_occupation: "Homemaker",
      number_of_brothers: getRandomInt(0, 2),
      number_of_sisters: getRandomInt(0, 2),
      city: city,
      district: city,
      state: "Tamil Nadu",
      country: "India",
      about_me: `I am a ${occ} working in ${city}. Looking for a compatible life partner who values family and relationships.`,
      food_habit: getRandomElement(["Vegetarian", "Non-Vegetarian"]),
      smoking: "No",
      drinking: "No",
      languages_known: ["Tamil", "English"],
      interests: getRandomElements(["Technology", "Fitness", "Movies", "Arts"], 2),
      hobbies: getRandomElements(["Reading", "Traveling", "Music", "Cooking"], 2),
      horoscope: {
        nakshatra: getRandomElement(nakshatras),
        rasi: getRandomElement(rasis),
        lagnam: getRandomElement(rasis),
        gothram: "Siva",
        dasa_balance: "Rahu 3y"
      },
      preferences: {
        pref_age_min: isMale ? Math.max(18, age - 5) : age,
        pref_age_max: isMale ? age : Math.min(45, age + 5),
        pref_height_min: isMale ? 140 : heightCm,
        pref_height_max: isMale ? heightCm : 200,
        pref_marital_status: [maritalStatus],
        pref_religion: [religion],
        pref_caste: ["Any", caste],
        pref_education: ["Any", edu],
        pref_occupation: ["Any"],
        pref_location: ["Tamil Nadu"],
        pref_food_habit: ["Any"]
      }
    };

    users.push(userObj);
  }

  return users;
};

const data = generateData();
fs.writeFileSync('C:/Users/VINOTH/Pictures/MATRIMONY/supabase/dummy_users.json', JSON.stringify(data, null, 2));
console.log('Successfully generated 500 flat dummy records.');
