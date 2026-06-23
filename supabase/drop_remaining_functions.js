const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

const drops = [
  { name: 'check_max_photos', args: '' },
  { name: 'check_user_exists', args: 'TEXT, TEXT' },
  { name: 'calculate_compatibility', args: 'UUID, UUID' },
  { name: 'update_profile_completion', args: '' },
  { name: 'send_interest_with_quota', args: 'UUID, UUID, TEXT' },
  // sometimes text parameter is optional or has different signature, we should also drop old forms
  { name: 'send_interest_with_quota', args: 'UUID, UUID' },
  { name: 'view_contact_with_quota', args: 'UUID, UUID' },
  { name: 'pass_profile', args: 'UUID, UUID' },
  { name: 'get_revenue_stats', args: '' },
  { name: 'is_admin', args: '' },
  { name: 'update_subscription_plan', args: 'TEXT, TEXT, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER' },
  // drop old signature of update_subscription_plan too
  { name: 'update_subscription_plan', args: 'TEXT, TEXT, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER' }
];

for (const drop of drops) {
  // We'll just prepend the DROP FUNCTION right before CREATE OR REPLACE FUNCTION public.name OR just CREATE OR REPLACE FUNCTION name
  const regex = new RegExp(`(CREATE OR REPLACE FUNCTION (public\\.)?${drop.name}\\()`, 'g');
  content = content.replace(regex, `DROP FUNCTION IF EXISTS public.${drop.name}(${drop.args});\n$1`);
}

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Done!');
