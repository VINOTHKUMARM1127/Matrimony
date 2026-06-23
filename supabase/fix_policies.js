const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

// Regex to find CREATE POLICY "name" ON public.table_name
// Example: CREATE POLICY "users_own" ON public.users FOR ALL USING ...
const policyRegex = /CREATE POLICY "([^"]+)" ON (public\.[a_zA-Z0-9_]+)/g;

content = content.replace(policyRegex, (match, policyName, tableName) => {
    return `DROP POLICY IF EXISTS "${policyName}" ON ${tableName};\n${match}`;
});

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', content);
console.log('Done!');
