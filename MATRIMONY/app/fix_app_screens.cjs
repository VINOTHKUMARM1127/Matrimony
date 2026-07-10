const fs = require('fs');
const path = require('path');

const walkSync = (dir, filelist = []) => {
  fs.readdirSync(dir).forEach(file => {
    const dirFile = path.join(dir, file);
    if (fs.statSync(dirFile).isDirectory()) {
      if (!dirFile.includes('admin')) {
        filelist = walkSync(dirFile, filelist);
      }
    } else {
      if (dirFile.endsWith('.js') || dirFile.endsWith('.jsx') || dirFile.endsWith('.ts') || dirFile.endsWith('.tsx')) {
        filelist.push(dirFile);
      }
    }
  });
  return filelist;
};

const files = walkSync(path.join(__dirname, 'src/screens'));
files.push(path.join(__dirname, 'src/components/profile/ProfilePhoto.jsx'));
files.push(path.join(__dirname, 'src/components/profile/ProfileCard.jsx'));
files.push(path.join(__dirname, 'src/components/profile/ProfileHeader.jsx'));

for (const filePath of files) {
  if (!fs.existsSync(filePath)) continue;
  let content = fs.readFileSync(filePath, 'utf8');
  let original = content;

  // 1. Easy schema renames
  content = content.replace(/\.profile_completion/g, '.profile_completion_percent');
  content = content.replace(/\.date_of_birth/g, '.dob');
  
  // 2. Names (carefully)
  content = content.replace(/profile\.name/g, 'profile.full_name');
  content = content.replace(/p\.name/g, 'p.full_name');
  content = content.replace(/u\.name/g, 'u.full_name');
  content = content.replace(/user\.name/g, 'user.full_name');
  content = content.replace(/display_name/g, 'full_name');
  
  // 3. Memberships
  content = content.replace(/user_memberships/g, 'user_subscriptions');
  content = content.replace(/m\.tier/g, 'm.membership_plans?.tier');
  
  // 4. is_active instead of status === 'active' (for memberships only if easy, but leave complex ones)
  content = content.replace(/status === 'active'/g, 'is_active');
  
  // 5. Registration steps check
  content = content.replace(/registrationStep === 6/g, 'registrationStep === 7');
  
  // 6. Horoscope
  content = content.replace(/horoscope_details/g, 'user_horoscope');

  if (content !== original) {
    fs.writeFileSync(filePath, content);
    console.log(`Updated ${path.basename(filePath)}`);
  }
}
