const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

// Replace the literal backtick n with actual newlines
content = content.replace(/`nCREATE POLICY/g, '\nCREATE POLICY');

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Fixed literal backtick n!');
