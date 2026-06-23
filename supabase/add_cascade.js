const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

// Replace all DROP FUNCTION IF EXISTS public.func_name(...) with CASCADE
content = content.replace(/DROP FUNCTION IF EXISTS ([^;]+);/g, (match, p1) => {
    // don't add cascade if it already has it
    if (p1.trim().toUpperCase().endsWith('CASCADE')) {
        return match;
    }
    return `DROP FUNCTION IF EXISTS ${p1} CASCADE;`;
});

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Added CASCADE to all DROP FUNCTIONs!');
