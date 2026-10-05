const fs = require('fs');

const file = 'tamil99_suite_typing_studio_ultra_premium/index.html';
let content = fs.readFileSync(file, 'utf8');

// The main tag currently has `pt-24`
content = content.replace(/<main class="relative pt-24 /g, '<main class="relative pt-0 ');

// The wrapper we added was `<div class="pl-64 mt-8">`
// Let's keep `mt-8` to align with the sidebar which is `top-8`.
// But wait, pt-24 might also be on the dashboard. Let's just remove pt-24.

fs.writeFileSync(file, content);
console.log('Removed pt-24 padding.');
