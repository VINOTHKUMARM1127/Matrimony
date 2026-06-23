const fs = require('fs');
let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

// The faulty regex matched get_user_quotas and inserted a drop for get_user_quota.
// Let's remove the line DROP FUNCTION IF EXISTS public.get_user_quota(UUID) CASCADE; if it is right before DROP FUNCTION IF EXISTS public.get_user_quotas
content = content.replace(
  /DROP FUNCTION IF EXISTS public\.get_user_quota\(UUID\) CASCADE;\nDROP FUNCTION IF EXISTS public\.get_user_quotas/g,
  'DROP FUNCTION IF EXISTS public.get_user_quotas'
);

// There are also duplicated DROP FUNCTION lines because of my multiple scripts. Let's deduplicate consecutive identical lines just for cleanliness.
const lines = content.split('\n');
const cleanLines = [];
let lastLine = '';
for (const line of lines) {
  if (line.trim() !== '' && line.trim() === lastLine.trim() && line.startsWith('DROP FUNCTION')) {
     continue;
  }
  cleanLines.push(line);
  lastLine = line;
}

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', cleanLines.join('\n'));
console.log('Cleaned up duplicate drops!');
