const fs = require('fs');

let path = 'fluent_tamil_precision/index.html';
let content = fs.readFileSync(path, 'utf8');

// Replace the light body tag with the dark premium body tag
content = content.replace(/<body class="bg-\[#f7f8fe\][^>]*">/, '<body class="bg-[#1a0f14] text-white antialiased overflow-hidden selection:bg-[#d4af37]/30">');

fs.writeFileSync(path, content);
console.log('Fluent Tamil body updated to dark premium theme.');
