const fs = require('fs');
const path = 'tamil99_suite_typing_studio_ultra_premium/index.html';
let content = fs.readFileSync(path, 'utf8');

// Replace the light body tag with the dark premium body tag
content = content.replace(/<body class="bg-\[#f7f8fd\] text-on-surface[^>]*">/, '<body class="bg-[#1a0f14] text-white antialiased overflow-x-hidden selection:bg-[#d4af37]/30">');

fs.writeFileSync(path, content);
console.log('Typing Studio body updated to dark premium theme.');
