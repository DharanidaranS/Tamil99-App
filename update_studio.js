const fs = require('fs');

let aside = fs.readFileSync('aside.txt', 'utf8');

// Swap Dashboard to inactive
aside = aside.replace(
    /aria-current="page" class="relative flex items-center gap-3 px-3 py-2 transition-all bg-gradient-to-r from-\[#8b1e2b\] via-\[#6f121d\] to-\[#4c0913\] text-white font-semibold rounded-xl shadow-\[0_4px_16px_rgba\(139,30,43,0\.4\)\] border border-\[#d4af37\]\/30" data-path="dashboard"/g,
    'class="flex items-center gap-3 px-3 py-1.5 rounded-lg text-white/75 hover:bg-white/10 hover:text-white transition-all group" data-path="dashboard"'
);
// Remove gold bar and pip from Dashboard
aside = aside.replace('<span class="absolute left-0 top-1.5 bottom-1.5 w-1 rounded-r-full bg-[#d4af37] shadow-[0_0_8px_#d4af37]"></span>\n', '');
aside = aside.replace('<span class="ml-auto w-1.5 h-1.5 rounded-full bg-[#d4af37] shadow-[0_0_6px_#d4af37]"></span>\n', '');

// Swap Tamil99 Typing to active
const oldActive = `<a class="flex items-center gap-3 px-3 py-1.5 rounded-lg text-white/75 hover:bg-white/10 hover:text-white transition-all group" data-path="tamil99-typing" href="#">
<span class="material-symbols-outlined text-[20px] text-white/50 group-hover:text-[#f5d77f] transition-colors">keyboard</span>
<span class="font-label-lg text-label-lg">Tamil99 Typing</span>
</a>`;

const newActive = `<a aria-current="page" class="relative flex items-center gap-3 px-3 py-2 transition-all bg-gradient-to-r from-[#8b1e2b] via-[#6f121d] to-[#4c0913] text-white font-semibold rounded-xl shadow-[0_4px_16px_rgba(139,30,43,0.4)] border border-[#d4af37]/30" data-path="tamil99-typing" href="#">
<span class="absolute left-0 top-1.5 bottom-1.5 w-1 rounded-r-full bg-[#d4af37] shadow-[0_0_8px_#d4af37]"></span>
<span class="material-symbols-outlined text-[20px] text-[#f5d77f]">keyboard</span>
<span class="font-label-lg text-label-lg tracking-wide">Tamil99 Typing</span>
<span class="ml-auto w-1.5 h-1.5 rounded-full bg-[#d4af37] shadow-[0_0_6px_#d4af37]"></span>
</a>`;

aside = aside.replace(oldActive, newActive);

let tsContent = fs.readFileSync('tamil99_suite_typing_studio_ultra_premium/index.html', 'utf8');

const newHeader = `
<div class="fixed top-0 left-0 right-0 h-8 bg-[#1a0f14]/80 backdrop-blur-xl border-b border-[#d4af37]/20 z-50 flex items-center justify-between px-4 select-none">
<div class="flex items-center gap-2">
<img alt="Tamil99 Suite Emblem" class="h-4 w-auto object-contain drop-shadow-sm" src="https://lh3.googleusercontent.com/aida/AEtjO1Vkz3GftSB_0bEAXtNZFpmHLpuS_5RYRh-rJ02yQQeVJkLR_uHLXHoLSreg6xtZTctjIuPUmQLM_TyOmlpROLQXOweZpFCo5I9qOS3JuMLA-gPJkoIbIT3OyLTYdpol9qBxKrU2SslmCAaOXFzKKL2ts5cWOM6gF_z2X6lzqrAM0zvKcEKPltx-J9pfIzrL9HUYz0HdZTuusKo0YIWDNV2HynLX8g_xHM3fzAdlxJ9ngGRx8oEB5VK-dlY"/>
<span class="font-label-sm text-[11px] text-white/70 font-medium tracking-wide">Tamil99 Smart Typing Suite — Windows Studio Pro Edition v1.0.4</span>
<span class="ml-2 px-1.5 py-0.2 bg-[#8b1e2b]/30 text-[#f5d77f] border border-[#d4af37]/30 rounded text-[9px] font-mono font-bold tracking-tight">MICA ACTIVE</span>
</div>
<div class="flex items-center">
<button class="h-8 px-3 flex items-center justify-center text-white/50 hover:bg-white/10 hover:text-white transition-colors"><span class="material-symbols-outlined text-[16px]">minimize</span></button>
<button class="h-8 px-3 flex items-center justify-center text-white/50 hover:bg-white/10 hover:text-white transition-colors"><span class="material-symbols-outlined text-[14px]">crop_square</span></button>
<button class="h-8 px-3 flex items-center justify-center text-white/50 hover:bg-red-500 hover:text-white transition-colors"><span class="material-symbols-outlined text-[16px]">close</span></button>
</div>
</div>
`;

// Replace aside
tsContent = tsContent.replace(/<aside[\s\S]*?<\/aside>/, aside);

// Replace windows shell header (the first fixed div)
tsContent = tsContent.replace(/<div class="fixed top-0 left-0 right-0 h-8 bg-surface-container-high\/70[\s\S]*?<\/div>\n<\/div>/, newHeader);

// Adjust widths for new sidebar
tsContent = tsContent.replace(/pl-64/g, 'pl-[260px]');
tsContent = tsContent.replace(/left-64/g, 'left-[260px]');

// Ensure typing studio layout has the routing JS so navigation still works
if (!tsContent.includes('dashboard_inject_final_v2.js') && !tsContent.includes('Production Pages Engine')) {
    tsContent = tsContent.replace('</body>', '<script src="../dashboard_inject_final_v2.js"></script></body>');
}

fs.writeFileSync('tamil99_suite_typing_studio_ultra_premium/index.html', tsContent);
console.log('Typing Studio updated with premium dashboard sidebar.');
