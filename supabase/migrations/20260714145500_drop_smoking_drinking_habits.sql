-- Drop smoking and drinking habit columns from user_lifestyle

alter table user_lifestyle
  drop column if exists smoking_habit,
  drop column if exists drinking_habit;
