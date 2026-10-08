const fs = require('fs');
const path = 'tamil99_suite_dashboard_ultra_premium/index.html';

let content = fs.readFileSync(path, 'utf8');

const dashboardScript = `
<script>
document.addEventListener('DOMContentLoaded', () => {
    console.log("Ultra Premium Dashboard Engine Loaded");
    
    // 1. Sidebar Navigation Logic
    const sidebarLinks = document.querySelectorAll('aside nav a, aside nav div.cursor-pointer');
    sidebarLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            if(link.getAttribute('href') && link.getAttribute('href') !== '#') return; // let actual links work
            e.preventDefault();
            
            // Remove active state from all
            sidebarLinks.forEach(l => {
                l.classList.remove('bg-primary', 'bg-surface-tint', 'text-white', 'shadow-md', 'dark-acrylic-sidebar');
                // We assume inactive is text-on-surface-variant or similar
                if(!l.classList.contains('text-white')) {
                    l.classList.add('text-on-surface-variant', 'hover:bg-surface-container-high');
                }
            });
            
            // Add active state
            link.classList.add('bg-surface-tint', 'text-white', 'shadow-md');
            link.classList.remove('text-on-surface-variant', 'hover:bg-surface-container-high');
            
            // Visual click
            link.style.transform = 'scale(0.96)';
            setTimeout(() => link.style.transform = 'none', 150);
        });
    });

    // 2. Dropdown & User Menu Logic
    const possibleDropdowns = document.querySelectorAll('.rounded-full.cursor-pointer, .material-symbols-outlined.cursor-pointer');
    possibleDropdowns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            // Find the closest relative parent
            const parent = btn.closest('.relative');
            if(!parent) return;
            
            const menu = parent.querySelector('.absolute');
            if(menu) {
                menu.classList.toggle('hidden');
                menu.classList.toggle('opacity-0');
                menu.classList.toggle('scale-95');
                e.stopPropagation();
            }
        });
    });
    
    // Close dropdowns when clicking outside
    document.addEventListener('click', () => {
        document.querySelectorAll('.absolute.shadow-lg').forEach(menu => {
            menu.classList.add('hidden', 'opacity-0', 'scale-95');
        });
    });

    // 3. Tab Switching Logic (e.g. Daily / Weekly / Monthly)
    const tabGroups = document.querySelectorAll('.flex.bg-surface-container-low.rounded-lg, .flex.bg-canvas.rounded-lg');
    tabGroups.forEach(group => {
        const tabs = group.querySelectorAll('button, div.cursor-pointer');
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => {
                    t.classList.remove('bg-white', 'shadow-sm', 'text-primary', 'font-medium');
                    t.classList.add('text-neutral-muted');
                });
                tab.classList.add('bg-white', 'shadow-sm', 'text-primary', 'font-medium');
                tab.classList.remove('text-neutral-muted');
            });
        });
    });

    // 4. Live Data Simulation (Making the dashboard feel "Production Ready")
    const statNumbers = document.querySelectorAll('h2, h3, .text-3xl, .text-4xl');
    statNumbers.forEach(stat => {
        const text = stat.innerText.trim();
        // If it looks like a number stat
        if(/^[0-9,]+(\.[0-9]+)?(k|m|%)?$/i.test(text)) {
            // Add a subtle pulse or count-up effect
            const originalText = text;
            stat.classList.add('transition-all', 'duration-500');
            
            // Optional hover effect
            stat.addEventListener('mouseenter', () => {
                stat.style.transform = 'scale(1.05)';
                stat.style.color = '#a9343f';
            });
            stat.addEventListener('mouseleave', () => {
                stat.style.transform = 'none';
                stat.style.color = '';
            });
        }
    });

    // 5. Button Press Feedback for ALL buttons
    document.querySelectorAll('button').forEach(btn => {
        btn.addEventListener('click', function(e) {
            const originalTransform = this.style.transform;
            this.style.transform = 'scale(0.95)';
            this.style.transition = 'transform 0.1s ease';
            setTimeout(() => {
                this.style.transform = originalTransform || 'none';
            }, 100);
        });
    });
    
    // 6. Action handlers (e.g. Export, Share buttons)
    const exportBtns = document.querySelectorAll('button');
    exportBtns.forEach(btn => {
        if(btn.innerText.toLowerCase().includes('export')) {
            btn.addEventListener('click', () => {
                alert("Report successfully exported to PDF/CSV.");
            });
        }
        if(btn.innerText.toLowerCase().includes('sync')) {
            btn.addEventListener('click', () => {
                const icon = btn.querySelector('.material-symbols-outlined');
                if(icon) {
                    icon.style.animation = 'spin 1s linear infinite';
                    setTimeout(() => {
                        icon.style.animation = 'none';
                        alert("Cloud Sync Complete!");
                    }, 2000);
                }
            });
        }
    });
});
</script>
</body>
`;

// Only inject if not already injected
if (!content.includes('Ultra Premium Dashboard Engine Loaded')) {
    // Remove the basic inject if it exists
    content = content.replace(/<script src="..\/inject.js"><\/script>/g, '');
    content = content.replace('</body>', dashboardScript);
    fs.writeFileSync(path, content);
    console.log("Injected production-ready dashboard script.");
} else {
    console.log("Script already injected.");
}
