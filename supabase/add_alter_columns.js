const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

const alterTableStatements = `
-- Safely add missing columns to existing profiles table
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS education text;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS tier text default 'free';
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS is_premium boolean default false;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS premium_expires_at timestamptz;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS contacts_remaining integer default 0;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS interests_remaining integer default 0;
`;

// Find where CREATE TABLE IF NOT EXISTS public.profiles ends, and insert the ALTER TABLE statements.
// The easiest way is to find the line that creates family_details, which comes right after profiles.

content = content.replace(
  /CREATE TABLE IF NOT EXISTS public\.family_details/g,
  alterTableStatements + '\nCREATE TABLE IF NOT EXISTS public.family_details'
);

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Added ALTER TABLE statements for profiles!');
