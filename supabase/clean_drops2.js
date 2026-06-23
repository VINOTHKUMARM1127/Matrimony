const fs = require('fs');
let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

// There's a sequence:
// DROP FUNCTION IF EXISTS public.get_user_quota(UUID) CASCADE;
// DROP FUNCTION IF EXISTS public.get_user_quotas(UUID) CASCADE;
// CREATE OR REPLACE FUNCTION public.get_user_quotas(p_user_id UUID)

content = content.replace(
  /DROP FUNCTION IF EXISTS public\.get_user_quota\(UUID\) CASCADE;\r?\nDROP FUNCTION IF EXISTS public\.get_user_quotas\(UUID\) CASCADE;/g,
  'DROP FUNCTION IF EXISTS public.get_user_quotas(UUID) CASCADE;'
);

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Removed stray get_user_quota drop!');
