const fs = require('fs');

const missingCSS = `
    /* Premium Sidebar and Accent Classes */
    .dark-acrylic-sidebar {
      background: linear-gradient(180deg, #2a050c 0%, #1e0308 50%, #150205 100%);
      backdrop-filter: blur(24px);
    }
    .acrylic-glass {
      background: rgba(255, 255, 255, 0.82);
      backdrop-filter: blur(20px) saturate(180%);
      -webkit-backdrop-filter: blur(20px) saturate(180%);
      border: 1px solid rgba(255, 255, 255, 0.85);
      box-shadow: 0 10px 30px -10px rgba(107, 2, 23, 0.07), 0 1px 3px 0 rgba(0, 0, 0, 0.02);
    }
    .gold-gradient-text {
      background: linear-gradient(135deg, #70111d 0%, #a9343f 45%, #b8860b 80%, #d4af37 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .gold-badge {
      background: linear-gradient(135deg, #fff6dd 0%, #fae6b2 50%, #f4d385 100%);
      border: 1px solid rgba(212, 175, 55, 0.45);
      box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.9), 0 2px 6px rgba(184, 134, 11, 0.15);
    }
    .card-specular { position: relative; }
    .card-specular::before {
      content: ''; position: absolute; top: 0; left: 0; right: 0; height: 1px;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.9), transparent);
      pointer-events: none;
    }
`;

function fixLayout(filePath) {
    let content = fs.readFileSync(filePath, 'utf8');

    // Insert CSS if missing
    if (!content.includes('.dark-acrylic-sidebar')) {
        content = content.replace('</style>', missingCSS + '\n</style>');
    }

    // Insert wrapper if missing
    if (!content.includes('<div class="pl-64 mt-8">')) {
        content = content.replace(/<main([^>]*)>/, '<div class="pl-64 mt-8">\n    <main$1>');
        content = content.replace('</main>', '</main>\n    </div>');
    }

    fs.writeFileSync(filePath, content);
    console.log('Fixed layout in ' + filePath);
}

fixLayout('tamil99_suite_typing_studio_ultra_premium/index.html');
fixLayout('fluent_tamil_precision/index.html');
