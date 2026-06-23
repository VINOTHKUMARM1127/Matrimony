const fs = require('fs');
const lines = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8').split('\n');
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('get_user_quota')) {
    console.log(`${i+1}: ${lines[i].trim()}`);
  }
}
