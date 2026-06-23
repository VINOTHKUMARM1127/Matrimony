const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

// Insert DROP FUNCTION statements for the 3 main feed functions
content = content.replace(
  /CREATE OR REPLACE FUNCTION public\.get_recommended_profiles/g,
  'DROP FUNCTION IF EXISTS public.get_recommended_profiles(UUID, INTEGER, INTEGER);\nCREATE OR REPLACE FUNCTION public.get_recommended_profiles'
);

content = content.replace(
  /CREATE OR REPLACE FUNCTION public\.get_nearby_profiles/g,
  'DROP FUNCTION IF EXISTS public.get_nearby_profiles(UUID, INTEGER, INTEGER);\nCREATE OR REPLACE FUNCTION public.get_nearby_profiles'
);

content = content.replace(
  /CREATE OR REPLACE FUNCTION public\.get_daily_matches/g,
  'DROP FUNCTION IF EXISTS public.get_daily_matches(UUID, INTEGER, INTEGER);\nCREATE OR REPLACE FUNCTION public.get_daily_matches'
);

// We should also drop the others just in case their signature or return type changed.
content = content.replace(
  /CREATE OR REPLACE FUNCTION public\.get_user_quota/g,
  'DROP FUNCTION IF EXISTS public.get_user_quota(UUID);\nCREATE OR REPLACE FUNCTION public.get_user_quota'
);

content = content.replace(
  /CREATE OR REPLACE FUNCTION public\.get_user_quotas/g,
  'DROP FUNCTION IF EXISTS public.get_user_quotas(UUID);\nCREATE OR REPLACE FUNCTION public.get_user_quotas'
);

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Added DROP FUNCTION statements!');
