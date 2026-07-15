-- Drop the NOT NULL constraint on the degree column in profiles
alter table profiles alter column degree drop not null;

-- Drop the income check constraint since it fails before we reach the income step
alter table profiles drop constraint if exists profiles_check;

-- Make all step 1 core demographic fields nullable so the initial row insert 
-- during signup doesn't require us to send fake default data.
alter table profiles
  alter column full_name drop not null,
  alter column gender drop not null,
  alter column dob drop not null,
  alter column height_cm drop not null;
