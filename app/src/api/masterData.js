/**
 * Wedring Matrimony — Master Data API
 * Fetch options for dropdowns like Religion, Caste, Location
 */
import supabase from './supabaseClient';

export const getReligions = async () => {
  const { data, error } = await supabase
    .from('master_religions')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getCastes = async (religionId) => {
  if (!religionId) return [];
  const { data, error } = await supabase
    .from('master_castes')
    .select('*')
    .eq('religion_id', religionId)
    .order('name');
  if (error) throw error;
  return data;
};

export const getCountries = async () => {
  const { data, error } = await supabase
    .from('master_countries')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getStates = async (countryId) => {
  if (!countryId) return [];
  const { data, error } = await supabase
    .from('master_states')
    .select('*')
    .eq('country_id', countryId)
    .order('name');
  if (error) throw error;
  return data;
};

export const getDistricts = async (stateId) => {
  if (!stateId) return [];
  const { data, error } = await supabase
    .from('master_districts')
    .select('*')
    .eq('state_id', stateId)
    .order('name');
  if (error) throw error;
  return data;
};

export const getCities = async (districtId) => {
  if (!districtId) return [];
  const { data, error } = await supabase
    .from('master_cities')
    .select('*')
    .eq('district_id', districtId)
    .order('name');
  if (error) throw error;
  return data;
};
