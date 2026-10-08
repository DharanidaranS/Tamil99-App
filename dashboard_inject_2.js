const fs = require('fs');
const path = 'tamil99_suite_dashboard_ultra_premium/index.html';

let content = fs.readFileSync(path, 'utf8');

const updatedScript = `
<script>
document.addEventListener('DOMContentLoaded', () => {
    console.log("Ultra Premium Dashboard Routing Engine Loaded");
    
    // 1. Sidebar Navigation Routing
    const sidebarLinks = document.querySelectorAll('aside nav a');
    sidebarLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            const dataPath = link.getAttribute('data-path');
            if (dataPath) {
                e.preventDefault();
                
                // Visual Click
                link.style.transform = 'scale(0.95)';
                setTimeout(() => link.style.transform = 'none', 100);
                
                setTimeout(() => {
                    if (dataPath === 'dashboard') {
                        // Already here, maybe refresh or do nothing
                        console.log("Dashboard clicked");
                    } else if (dataPath === 'tamil99-typing' || dataPath === 'text-editor') {
                        window.location.href = '../tamil99_suite_typing_studio_ultra_premium/index.html';
                    } else if (dataPath === 'english-to-tamil') {
                        window.location.href = '../fluent_tamil_precision/index.html';
                    } else if (dataPath === 'voice-to-text') {
                        alert("Voice to Text module is initializing...");
                    } else {
                        alert("Opening " + dataPath + "...");
                    }
                }, 150);
            }
        });
    });

    // 2. Dropdown & User Menu Logic
    const dropDownToggles = document.querySelectorAll('.rounded-full.cursor-pointer, .material-symbols-outlined.cursor-pointer');
    dropDownToggles.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const parent = btn.closest('.relative');
            if(parent) {
                const menu = parent.querySelector('.absolute, [role="menu"]');
                if(menu) {
                    menu.classList.toggle('hidden');
                    menu.classList.toggle('opacity-0');
                    e.stopPropagation();
                }
            }
        });
    });
    
    document.addEventListener('click', () => {
        document.querySelectorAll('.absolute.shadow-lg, [role="menu"]').forEach(menu => {
            menu.classList.add('hidden', 'opacity-0');
        });
    });

    // 3. Tab Switching
    const tabGroups = document.querySelectorAll('.bg-surface-container-low, .bg-canvas');
    tabGroups.forEach(group => {
        const tabs = group.querySelectorAll('button, div.cursor-pointer');
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => {
                    t.classList.remove('bg-white', 'shadow-sm', 'text-primary');
                    t.classList.add('text-neutral-muted');
                    t.style.background = 'transparent';
                });
                tab.classList.add('shadow-sm', 'text-primary');
                tab.classList.remove('text-neutral-muted');
                tab.style.background = 'white';
            });
        });
    });

    // 4. Action Buttons (Export, Sync, Settings)
    document.querySelectorAll('button').forEach(btn => {
        const text = btn.innerText.toLowerCase();
        
        btn.addEventListener('click', function(e) {
            // Animation
            const originalTransform = this.style.transform;
            this.style.transform = 'scale(0.95)';
            this.style.transition = 'transform 0.1s ease';
            setTimeout(() => { this.style.transform = originalTransform || 'none'; }, 100);

            // Logic
            if(text.includes('export') || text.includes('download')) {
                setTimeout(() => alert("Your report is downloading..."), 150);
            } else if (text.includes('sync') || text.includes('refresh')) {
                const icon = this.querySelector('.material-symbols-outlined');
                if(icon) {
                    icon.style.animation = 'spin 1s linear infinite';
                    setTimeout(() => {
                        icon.style.animation = 'none';
                        alert("Synchronized with cloud successfully!");
                    }, 1000);
                }
            } else if (text.includes('settings') || text.includes('upgrade')) {
                setTimeout(() => alert("Opening preferences pane..."), 150);
            }
        });
    });
});
</script>
</body>
`;

// Replace the previous injection
content = content.replace(/<script>\s*document\.addEventListener\('DOMContentLoaded', \(\) => \{\s*console\.log\("Ultra Premium Dashboard Engine Loaded"\);[\s\S]*?<\/script>\s*<\/body>/, updatedScript);
fs.writeFileSync(path, content);
console.log("Updated dashboard script with cross-page routing.");
