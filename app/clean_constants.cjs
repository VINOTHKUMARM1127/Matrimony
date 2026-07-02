const fs = require('fs');
const path = require('path');

const constantsPath = path.join(__dirname, 'src/utils/constants.js');
let code = fs.readFileSync(constantsPath, 'utf8');

const toRemove = [
  'CASTES',
  'EDUCATION_LEVELS',
  'OCCUPATIONS',
  'RAASIS',
  'RELIGIONS',
  'STARS',
  'TN_DISTRICTS',
  'FAST2SMS_API_KEY',
  'FAST2SMS_BASE_URL'
];

for (const key of toRemove) {
  // Rough regex to remove export const KEY = ...
  // This might not match perfectly if it spans thousands of lines, but we can try.
  // Actually, split by `export const `
  const parts = code.split('export const ');
  const newParts = parts.filter(p => {
    // If this part starts with the key, we exclude it
    if (p.startsWith(key + ' =') || p.startsWith(key + '  =')) {
      return false;
    }
    return true;
  });
  code = newParts.join('export const ');
}

fs.writeFileSync(constantsPath, code);
console.log('Cleaned constants.js');
