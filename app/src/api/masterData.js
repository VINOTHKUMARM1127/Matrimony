/**
 * Wedring Matrimony — Master Data API
 * Fetch options for dropdowns: Religion, Caste, Location, Education, Occupation, Horoscope, etc.
 */
import supabase from './supabaseClient';

export const getReligions = async () => {
  const { data, error } = await supabase
    .from('religions')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getCastes = async (religionId) => {
  if (!religionId) return [];
  const { data, error } = await supabase
    .from('castes')
    .select('*')
    .eq('religion_id', religionId)
    .order('name');
  if (error) throw error;
  return data;
};

export const getSubCastes = async (casteId) => {
  if (!casteId) return [];
  const { data, error } = await supabase
    .from('sub_castes')
    .select('*')
    .eq('caste_id', casteId)
    .order('name');
  if (error) throw error;
  return data;
};

export const getCountries = async () => {
  const { data, error } = await supabase
    .from('countries')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getStates = async (countryId) => {
  if (!countryId) return [];
  const { data, error } = await supabase
    .from('states')
    .select('*')
    .eq('country_id', countryId)
    .order('name');
  if (error) throw error;
  return data;
};

export const getDistricts = async (stateId) => {
  if (!stateId) return [];
  const { data, error } = await supabase
    .from('districts')
    .select('*')
    .eq('state_id', stateId)
    .order('name');
  if (error) throw error;
  return data;
};

export const getCities = async (districtId) => {
  if (!districtId) return [];
  const { data, error } = await supabase
    .from('cities')
    .select('*')
    .eq('district_id', districtId)
    .order('name');
  if (error) throw error;
  return data;
};

// ----- NEW: Lookup tables for dropdowns -----

export const getOccupations = async () => {
  const { data, error } = await supabase
    .from('occupations')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getEducationLevels = async () => {
  const { data, error } = await supabase
    .from('education_levels')
    .select('*')
    .order('sort_order', { ascending: true });
  if (error) throw error;
  return data;
};

export const getRasi = async () => {
  const { data, error } = await supabase
    .from('rasi')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getNakshatra = async () => {
  const { data, error } = await supabase
    .from('nakshatra')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getLagnam = async () => {
  const { data, error } = await supabase
    .from('lagnam')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getGothram = async () => {
  const { data, error } = await supabase
    .from('gothram')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};

export const getMotherTongues = async () => {
  const { data, error } = await supabase
    .from('mother_tongues')
    .select('*')
    .order('name');
  if (error) throw error;
  return data;
};
