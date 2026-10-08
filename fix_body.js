const fs = require('fs');

const dashBody = '<body class="bg-[#f7f8fe] text-on-surface font-body-md text-body-md selection:bg-primary-container selection:text-on-primary relative overflow-x-hidden">';

function fixBody(filePath) {
    let content = fs.readFileSync(filePath, 'utf8');
    content = content.replace(/<body class="bg-\[#1a0f14\][^>]*">/, dashBody);
    fs.writeFileSync(filePath, content);
}

fixBody('tamil99_suite_typing_studio_ultra_premium/index.html');
fixBody('fluent_tamil_precision/index.html');
console.log('Fixed body tags to match dashboard light theme.');
