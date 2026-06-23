const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

const functionsToDrop = [
  'run_daily_distribution()',
  'process_expired_subscriptions()',
  'activate_next_queued(UUID)',
  'feed_allocation(UUID, TEXT, JSONB)',
  '_feed_excluded(UUID)',
  '_grant_plan_benefits(UUID, TEXT)',
  'tier_rank(TEXT)'
];

for (const func of functionsToDrop) {
  const funcName = func.split('(')[0];
  const regex = new RegExp(`CREATE OR REPLACE FUNCTION public\\.${funcName}`, 'g');
  content = content.replace(
    regex,
    `DROP FUNCTION IF EXISTS public.${func};\nCREATE OR REPLACE FUNCTION public.${funcName}`
  );
}

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Added more DROP FUNCTION statements!');
