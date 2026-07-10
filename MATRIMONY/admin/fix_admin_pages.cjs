const fs = require('fs');
const path = require('path');

const DIR = path.join(__dirname, 'src/pages/admin');
const files = fs.readdirSync(DIR).filter(f => f.endsWith('.jsx'));

for (const file of files) {
  const filePath = path.join(DIR, file);
  let content = fs.readFileSync(filePath, 'utf8');
  let original = content;

  // 1. Memberships
  content = content.replace(/user_memberships/g, 'user_subscriptions');
  content = content.replace(/m\.status === 'active'/g, 'm.is_active');
  content = content.replace(/activeMembership(?:\?)?\.tier/g, 'activeMembership?.membership_plans?.tier');
  content = content.replace(/m\.tier/g, 'm.membership_plans?.tier');
  content = content.replace(/q\.tier/g, 'q.membership_plans?.tier');
  content = content.replace(/h\.tier/g, 'h.membership_plans?.tier');
  
  // 2. Profile attributes
  content = content.replace(/\.profile_completion/g, '.profile_completion_percent');
  content = content.replace(/\.date_of_birth/g, '.dob');
  
  // 3. Names (careful not to replace component Names)
  content = content.replace(/u\.name/g, 'u.full_name');
  content = content.replace(/user\.name/g, 'user.full_name');
  content = content.replace(/p\.profile\?\.name/g, 'p.profile?.full_name');
  content = content.replace(/profile\.name/g, 'profile.full_name');
  content = content.replace(/form\.name/g, 'form.full_name');
  
  // 4. Photos
  content = content.replace(/photo\.photo_url/g, 'imageApi.getR2PublicUrl(photo.r2_key)');
  content = content.replace(/url\.photo_url/g, 'url.r2_key');
  
  // Ensure imageApi is imported if we used getR2PublicUrl
  if (content.includes('getR2PublicUrl') && !content.includes('imageApi')) {
    content = "import * as imageApi from '../../api/imageApi';\n" + content;
  }

  if (content !== original) {
    fs.writeFileSync(filePath, content);
    console.log(`Updated ${file}`);
  }
}
