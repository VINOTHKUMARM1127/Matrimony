const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

const lines = content.split('\n');
const newLines = [];
for (const line of lines) {
    if (line.trim().startsWith('CREATE POLICY')) {
        // Extract policy name and table name
        const match = line.match(/CREATE POLICY "([^"]+)" ON (public\.[a_zA-Z0-9_]+)/);
        if (match) {
            newLines.push(`DROP POLICY IF EXISTS "${match[1]}" ON ${match[2]};`);
        }
    }
    newLines.push(line);
}

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', newLines.join('\n'));
console.log('Done replacement!');
