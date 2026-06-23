const fs = require('fs');

let content = fs.readFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', 'utf8');

// We want to find ALL CREATE OR REPLACE FUNCTION declarations that don't already have a DROP FUNCTION right before them.
// But it's easier to just blindly prepend a DROP FUNCTION for all of them, ignoring if we duplicate it.
// Actually, let's extract the name and args.

const lines = content.split('\n');
const newLines = [];

for (let i = 0; i < lines.length; i++) {
  const line = lines[i];
  const match = line.match(/^CREATE OR REPLACE FUNCTION public\.([a-zA-Z0-9_]+)\((.*)\)/);
  if (match) {
    const funcName = match[1];
    let args = match[2];
    
    // We just want the types of the args, not the names.
    // e.g., "p_user_id UUID, p_is_admin BOOLEAN DEFAULT false" -> "UUID, BOOLEAN"
    let argTypes = [];
    if (args.trim() !== '') {
      const parts = args.split(',');
      for (const part of parts) {
        // e.g. "p_user_id UUID" or "p_limit INTEGER DEFAULT 20"
        const tokens = part.trim().split(/\s+/);
        // The type is usually the second token (e.g. p_user_id UUID)
        // If it's just UUID (no name), then it's the first token.
        // Let's just drop the function by name without args if it's the only one, but Postgres requires args if overloaded.
        // Let's try to extract the type. Usually the first token is param name (starting with p_ or v_), second is type.
        if (tokens.length >= 2 && !['OUT', 'IN', 'INOUT'].includes(tokens[0].toUpperCase())) {
           argTypes.push(tokens[1]);
        } else if (tokens.length === 1) {
           argTypes.push(tokens[0]);
        } else {
           // fallback just push the second token
           argTypes.push(tokens[1]);
        }
      }
    }
    
    // We will construct the DROP FUNCTION statement.
    const dropStmt = `DROP FUNCTION IF EXISTS public.${funcName}(${argTypes.join(', ')});`;
    newLines.push(dropStmt);
  }
  newLines.push(line);
}

fs.writeFileSync('00_COMPLETE_MATRIMONY_SCHEMA.sql', newLines.join('\n'));
console.log('Added DROP FUNCTION for everything!');
