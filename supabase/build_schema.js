const fs = require('fs');

const wedring = fs.readFileSync('wedring_schema.sql', 'utf8');
const finalFix = fs.readFileSync('FINAL_APP_FIX.sql', 'utf8');

// 1. We want to remove deprecated tables from wedring_schema.sql
let output = wedring.replace(/CREATE TABLE public\.user_memberships[\s\S]*?\);\n\n/g, '');
output = output.replace(/CREATE TABLE public\.purchase_history[\s\S]*?\);\n\n/g, '');
output = output.replace(/CREATE TABLE public\.profile_distribution[\s\S]*?\);\n\n/g, '');
output = output.replace(/CREATE TABLE public\.distribution_settings_history[\s\S]*?\);\n\n/g, '');
output = output.replace(/CREATE TABLE public\.user_profile_pool[\s\S]*?\);\n\n/g, '');

// 2. Remove deprecated functions from wedring_schema.sql
// We'll strip everything from "Feed functions reading from user_profile_pool" to the RLS section
output = output.replace(/-- Feed functions reading from user_profile_pool[\s\S]*?-- Revenue Stats/g, '-- Revenue Stats');

// We'll strip everything from "COMPLEX FUNCTIONS" down to the end of the file, because FINAL_APP_FIX provides all of that!
output = output.replace(/-- ==========================================\n-- COMPLEX FUNCTIONS[\s\S]*/g, '');

// 3. Fix the RLS section in wedring_schema.sql
output = output.replace(/ALTER TABLE public\.user_memberships ENABLE ROW LEVEL SECURITY;\n/g, '');
output = output.replace(/ALTER TABLE public\.profile_distribution ENABLE ROW LEVEL SECURITY;\n/g, '');
output = output.replace(/ALTER TABLE public\.user_profile_pool ENABLE ROW LEVEL SECURITY;\n/g, '');
output = output.replace(/ALTER TABLE public\.purchase_history ENABLE ROW LEVEL SECURITY;\n/g, '');

output = output.replace(/CREATE POLICY "memberships_own"[\s\S]*?\n/g, '');
output = output.replace(/CREATE POLICY "distrib_read_public"[\s\S]*?\n/g, '');
output = output.replace(/CREATE POLICY "pool_own"[\s\S]*?\n/g, '');
output = output.replace(/CREATE POLICY "purchase_own"[\s\S]*?\n/g, '');

// 4. Update the quota checks to use user_wallet instead of user_memberships
output = output.replace(/SELECT \* INTO active_sub FROM public\.user_memberships \n  WHERE user_id = p_sender_id AND status = 'active' AND tier != 'free' LIMIT 1;/g, 
`SELECT * INTO active_sub FROM public.user_wallet WHERE user_id = p_sender_id;`);

output = output.replace(/IF active_sub\.interest_credits_remaining <= 0 THEN/g, 
`IF active_sub IS NULL OR active_sub.interest_credits <= 0 THEN`);

output = output.replace(/UPDATE public\.user_memberships \n  SET interest_credits_remaining = interest_credits_remaining - 1\n  WHERE id = active_sub\.id;/g,
`UPDATE public.user_wallet \n  SET interest_credits = interest_credits - 1\n  WHERE user_id = p_sender_id;
  UPDATE public.profiles \n  SET interests_remaining = GREATEST(0, COALESCE(interests_remaining,0) - 1)\n  WHERE id = p_sender_id;`);

output = output.replace(/SELECT \* INTO active_sub FROM public\.user_memberships \n  WHERE user_id = p_viewer_id AND status = 'active' AND tier != 'free' LIMIT 1;/g,
`SELECT * INTO active_sub FROM public.user_wallet WHERE user_id = p_viewer_id;`);

output = output.replace(/IF active_sub\.contact_credits_remaining <= 0 THEN/g,
`IF active_sub IS NULL OR active_sub.contact_credits <= 0 THEN`);

output = output.replace(/UPDATE public\.user_memberships \n  SET contact_credits_remaining = contact_credits_remaining - 1\n  WHERE id = active_sub\.id;/g,
`UPDATE public.user_wallet \n  SET contact_credits = contact_credits - 1\n  WHERE user_id = p_viewer_id;
  UPDATE public.profiles \n  SET contacts_remaining = GREATEST(0, COALESCE(contacts_remaining,0) - 1)\n  WHERE id = p_viewer_id;`);

// 5. Append FINAL_APP_FIX.sql
output += '\n\n-- ==========================================\n-- UNIFIED DISTRIBUTION AND FEED ENGINE\n-- ==========================================\n\n';
output += finalFix;

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', output);
console.log('Done!');
