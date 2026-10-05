const fs = require('fs');

const dashHTML = fs.readFileSync('tamil99_suite_dashboard_ultra_premium/index.html', 'utf8');
const asideMatch = dashHTML.match(/<aside[\s\S]*?<\/aside>/);
if (!asideMatch) { console.error('Could not find aside in dashboard'); process.exit(1); }
let baseAside = asideMatch[0];

function fixFile(file, id) {
    let html = fs.readFileSync(file, 'utf8');
    
    // Find the end of the new header we inserted
    const headerEnd = '<button class="h-8 px-3 flex items-center justify-center text-white/50 hover:bg-red-500 hover:text-white transition-colors"><span class="material-symbols-outlined text-[16px]">close</span></button>\r\n</div>\r\n</div>';
    const headerEnd2 = '<button class="h-8 px-3 flex items-center justify-center text-white/50 hover:bg-red-500 hover:text-white transition-colors"><span class="material-symbols-outlined text-[16px]">close</span></button>\n</div>\n</div>';
    
    let startIdx = html.indexOf(headerEnd);
    let offset = headerEnd.length;
    if (startIdx === -1) {
        startIdx = html.indexOf(headerEnd2);
        offset = headerEnd2.length;
    }
    
    const endMarker = '<!-- Main Workspace -->';
    const endIdx = html.indexOf(endMarker);
    
    if (startIdx === -1 || endIdx === -1) {
        console.error('Could not find boundaries in ' + file);
        return;
    }
    
    let newAside = baseAside;
    
    // Deactivate Dashboard
    newAside = newAside.replace(
        /aria-current="page" class="relative flex items-center gap-3 px-3 py-2 transition-all bg-gradient-to-r from-\[#8b1e2b\] via-\[#6f121d\] to-\[#4c0913\] text-white font-semibold rounded-xl shadow-\[0_4px_16px_rgba\(139,30,43,0\.4\)\] border border-\[#d4af37\]\/30" data-path="dashboard"/g,
        'class="flex items-center gap-3 px-3 py-1.5 rounded-lg text-white/75 hover:bg-white/10 hover:text-white transition-all group" data-path="dashboard"'
    );
    newAside = newAside.replace('<span class="absolute left-0 top-1.5 bottom-1.5 w-1 rounded-r-full bg-[#d4af37] shadow-[0_0_8px_#d4af37]"></span>\n', '');
    newAside = newAside.replace('<span class="ml-auto w-1.5 h-1.5 rounded-full bg-[#d4af37] shadow-[0_0_6px_#d4af37]"></span>\n', '');
    
    // Activate target ID
    const oldTarget = new RegExp('<a class="flex items-center gap-3 px-3 py-1.5 rounded-lg text-white/75 hover:bg-white/10 hover:text-white transition-all group" data-path="' + id + '" href="#">[\\s\\S]*?</a>');
    
    const iconMatch = baseAside.match(new RegExp('data-path="' + id + '"[\\s\\S]*?<span class="material-symbols-outlined[^"]*">([^<]+)</span>[\\s\\S]*?<span class="font-label-lg text-label-lg">([^<]+)</span>'));
    
    if (iconMatch) {
        const icon = iconMatch[1];
        const text = iconMatch[2];
        const activeHTML = `<a aria-current="page" class="relative flex items-center gap-3 px-3 py-2 transition-all bg-gradient-to-r from-[#8b1e2b] via-[#6f121d] to-[#4c0913] text-white font-semibold rounded-xl shadow-[0_4px_16px_rgba(139,30,43,0.4)] border border-[#d4af37]/30" data-path="${id}" href="#">\n<span class="absolute left-0 top-1.5 bottom-1.5 w-1 rounded-r-full bg-[#d4af37] shadow-[0_0_8px_#d4af37]"></span>\n<span class="material-symbols-outlined text-[20px] text-[#f5d77f]">${icon}</span>\n<span class="font-label-lg text-label-lg tracking-wide">${text}</span>\n<span class="ml-auto w-1.5 h-1.5 rounded-full bg-[#d4af37] shadow-[0_0_6px_#d4af37]"></span>\n</a>`;
        newAside = newAside.replace(oldTarget, activeHTML);
    }

    const newHTML = html.substring(0, startIdx + offset) + '\n\n<!-- Sidebar -->\n' + newAside + '\n\n    ' + html.substring(endIdx);
    fs.writeFileSync(file, newHTML);
    console.log('Fixed ' + file);
}

fixFile('tamil99_suite_typing_studio_ultra_premium/index.html', 'tamil99-typing');
fixFile('fluent_tamil_precision/index.html', 'english-to-tamil');
