const fs = require('fs');

const dashFile = 'tamil99_suite_dashboard_ultra_premium/index.html';
let dashHTML = fs.readFileSync(dashFile, 'utf8');

const hashHandler = `
        // Check hash
        if (window.location.hash) {
            const hashId = window.location.hash.substring(1);
            const targetSection = document.getElementById('section-' + hashId);
            if (targetSection) {
                document.querySelectorAll('.page-section').forEach(sec => sec.classList.add('hidden'));
                targetSection.classList.remove('hidden');
                
                document.querySelectorAll('aside a, aside [data-path]').forEach(l => {
                    l.classList.remove('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                    l.classList.add('text-white/75', 'hover:bg-white/10');
                });
                
                const link = document.querySelector(\`aside [data-path*="\${hashId}"]\`);
                if (link) {
                    link.classList.add('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                    link.classList.remove('text-white/75', 'hover:bg-white/10');
                }
            }
        }
    } // End of initDashboard
`;

if (!dashHTML.includes('window.location.hash')) {
    dashHTML = dashHTML.replace('    }\n\n    if (document.readyState === \'loading\')', hashHandler + '\n    if (document.readyState === \'loading\')');
    fs.writeFileSync(dashFile, dashHTML);
    console.log('Added hash handler to dashboard');
} else {
    console.log('Hash handler already exists');
}
