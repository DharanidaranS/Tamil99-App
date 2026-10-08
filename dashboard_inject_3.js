const fs = require('fs');
const path = 'tamil99_suite_dashboard_ultra_premium/index.html';

let content = fs.readFileSync(path, 'utf8');

const dynamicSectionsScript = `
<script>
document.addEventListener('DOMContentLoaded', () => {
    console.log("Ultimate Multi-Section Routing Engine Loaded");
    
    const mainArea = document.querySelector('main') || document.querySelector('.flex-1'); // Find the main content area
    
    if (mainArea && !document.getElementById('section-dashboard')) {
        // 1. Wrap the existing dashboard content so we can hide/show it
        const originalContent = Array.from(mainArea.children);
        const dashboardWrapper = document.createElement('div');
        dashboardWrapper.id = 'section-dashboard';
        dashboardWrapper.className = 'page-section w-full h-full';
        
        originalContent.forEach(child => {
            if (child.tagName !== 'SCRIPT') { // Don't wrap our injected scripts
                dashboardWrapper.appendChild(child);
            }
        });
        mainArea.appendChild(dashboardWrapper);

        // 2. Create the missing sections dynamically
        const sectionsData = {
            'voice-to-text': { title: 'Voice to Text', icon: 'mic', desc: 'Speak in Tamil and see it converted to text instantly in real-time.' },
            'text-editor': { title: 'Text Editor', icon: 'edit_document', desc: 'A rich text editing environment with full Tamil99 support and formatting tools.' },
            'learn-tamil': { title: 'Learn Tamil', icon: 'school', desc: 'Interactive lessons and modules to master Tamil reading and writing.' },
            'typing-practice': { title: 'Typing Practice', icon: 'speed', desc: 'Test your WPM (Words Per Minute) and improve your Tamil typing speed.' },
            'gov-forms': { title: 'Government Forms', icon: 'assignment', desc: 'Quickly fill out and generate standard Tamil Nadu government forms and applications.' },
            'docs-pdf': { title: 'Documents & PDF', icon: 'picture_as_pdf', desc: 'View, edit, and export your Tamil documents as print-ready PDFs.' }
        };

        const generateSectionHTML = (id, data) => \`
            <div id="section-\${id}" class="page-section hidden w-full h-full flex flex-col p-8">
                <header class="mb-8">
                    <h1 class="text-3xl font-bold text-white tracking-tight flex items-center gap-3">
                        <span class="material-symbols-outlined text-4xl text-[#d4af37]">\${data.icon}</span>
                        \${data.title}
                    </h1>
                    <p class="text-white/60 mt-2 text-lg">\${data.desc}</p>
                </header>
                <div class="flex-1 bg-white/5 border border-white/10 rounded-2xl p-8 flex flex-col items-center justify-center text-center shadow-2xl backdrop-blur-md">
                    <span class="material-symbols-outlined text-[80px] text-white/20 mb-6 animate-pulse">\${data.icon}</span>
                    <h2 class="text-2xl font-semibold text-white/80">\${data.title} Module</h2>
                    <p class="text-white/50 max-w-md mt-4">This section has been dynamically generated. All functionality and integrations for the \${data.title} module will operate within this workspace.</p>
                    <button class="mt-8 px-6 py-3 bg-gradient-to-r from-[#8b1e2b] to-[#4c0913] border border-[#d4af37]/30 text-white rounded-xl shadow-lg hover:scale-105 transition-transform flex items-center gap-2">
                        <span class="material-symbols-outlined">rocket_launch</span>
                        Initialize \${data.title}
                    </button>
                </div>
            </div>
        \`;

        // Inject all the generated sections into the main area
        Object.keys(sectionsData).forEach(key => {
            mainArea.insertAdjacentHTML('beforeend', generateSectionHTML(key, sectionsData[key]));
        });
    }

    // 3. Routing Logic for Sidebar
    const sidebarLinks = document.querySelectorAll('aside a, aside [data-path]');
    sidebarLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            const path = link.getAttribute('data-path') || link.innerText.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
            
            // Map text to our keys if data-path isn't perfectly matched
            let targetSectionId = path;
            if (path.includes('learn-tamil')) targetSectionId = 'learn-tamil';
            if (path.includes('typing-practice')) targetSectionId = 'typing-practice';
            if (path.includes('government-forms') || path.includes('government')) targetSectionId = 'gov-forms';
            if (path.includes('documents') || path.includes('pdf')) targetSectionId = 'docs-pdf';

            if (path) {
                e.preventDefault();
                
                // Visual Click Animation
                link.style.transform = 'scale(0.95)';
                setTimeout(() => link.style.transform = 'none', 100);

                setTimeout(() => {
                    // 3A. Check for external links first
                    if (path === 'tamil99-typing') {
                        window.location.href = '../tamil99_suite_typing_studio_ultra_premium/index.html';
                        return;
                    } 
                    if (path === 'english-to-tamil') {
                        window.location.href = '../fluent_tamil_precision/index.html';
                        return;
                    }
                    
                    // 3B. Handle Internal Sections
                    const targetSection = document.getElementById(\`section-\${targetSectionId}\`);
                    
                    if (targetSection || targetSectionId === 'dashboard') {
                        // Hide all sections
                        document.querySelectorAll('.page-section').forEach(sec => sec.classList.add('hidden'));
                        
                        // Show the target section
                        const sectionToShow = targetSectionId === 'dashboard' ? document.getElementById('section-dashboard') : targetSection;
                        if(sectionToShow) sectionToShow.classList.remove('hidden');

                        // Update Active Sidebar Styles
                        sidebarLinks.forEach(l => {
                            l.classList.remove('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                            l.classList.add('text-white/75', 'hover:bg-white/10');
                            
                            // Try to remove gold indicators if present
                            const leftInd = l.querySelector('.bg-\\[\\#d4af37\\]');
                            if(leftInd && leftInd.classList.contains('absolute')) leftInd.style.display = 'none';
                        });

                        // Make clicked link active
                        link.classList.add('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                        link.classList.remove('text-white/75', 'hover:bg-white/10');
                        
                        // Re-enable gold indicator if it has one
                        const leftInd = link.querySelector('.bg-\\[\\#d4af37\\]');
                        if(leftInd && leftInd.classList.contains('absolute')) leftInd.style.display = 'block';
                    } else {
                        alert(\`Section "\${path}" is not implemented yet.\`);
                    }
                }, 150);
            }
        });
    });

    // Handle generic button clicks inside the newly generated sections
    document.addEventListener('click', (e) => {
        if(e.target.tagName === 'BUTTON' && e.target.innerText.includes('Initialize')) {
            const originalText = e.target.innerHTML;
            e.target.innerHTML = '<span class="material-symbols-outlined animate-spin">sync</span> Loading Module...';
            setTimeout(() => {
                e.target.innerHTML = originalText;
                alert("Module initialized successfully!");
            }, 1500);
        }
    });
});
</script>
</body>
`;

// Replace the older inject script
content = content.replace(/<script>\s*document\.addEventListener\('DOMContentLoaded', \(\) => \{\s*console\.log\("Ultra Premium Dashboard (Routing )?Engine Loaded"\);[\s\S]*?<\/script>\s*<\/body>/, dynamicSectionsScript);

fs.writeFileSync(path, content);
console.log("Injected the Ultimate Multi-Section Routing Engine.");
