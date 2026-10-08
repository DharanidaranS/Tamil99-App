const fs = require('fs');

function updateScript(filePath) {
    let content = fs.readFileSync(filePath, 'utf8');
    content = content.replace(/<script src="\.\.\/dashboard_inject_final_v2\.js"><\/script>/g, '<script src="../router.js"></script>');
    fs.writeFileSync(filePath, content);
    console.log('Updated routing in ' + filePath);
}

updateScript('tamil99_suite_typing_studio_ultra_premium/index.html');
updateScript('fluent_tamil_precision/index.html');
