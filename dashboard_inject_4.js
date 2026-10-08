const fs = require('fs');
const path = 'tamil99_suite_dashboard_ultra_premium/index.html';

let content = fs.readFileSync(path, 'utf8');

const productionPagesScript = `
<script>
document.addEventListener('DOMContentLoaded', () => {
    console.log("Production Pages Engine Loaded");
    
    const mainArea = document.querySelector('main') || document.querySelector('.flex-1');
    
    if (mainArea && !document.getElementById('section-dashboard')) {
        // 1. Wrap the existing dashboard content
        const originalContent = Array.from(mainArea.children);
        const dashboardWrapper = document.createElement('div');
        dashboardWrapper.id = 'section-dashboard';
        dashboardWrapper.className = 'page-section w-full h-full';
        
        originalContent.forEach(child => {
            if (child.tagName !== 'SCRIPT') dashboardWrapper.appendChild(child);
        });
        mainArea.appendChild(dashboardWrapper);

        // 2. Complex HTML for each section
        const sectionsHTML = {
            'voice-to-text': \`
                <div id="section-voice-to-text" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                    <header class="mb-6 flex justify-between items-center">
                        <div>
                            <h1 class="text-3xl font-bold text-neutral">Voice to Text</h1>
                            <p class="text-neutral-muted mt-1">Real-time Tamil speech recognition engine</p>
                        </div>
                        <div class="flex gap-4 items-center">
                            <span class="flex items-center gap-2 text-sm font-medium text-emerald-600 bg-emerald-100 px-3 py-1.5 rounded-full">
                                <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span> Microphone Ready
                            </span>
                        </div>
                    </header>
                    <div class="flex-1 bg-white rounded-2xl shadow-sm border border-border p-6 flex flex-col items-center justify-center relative">
                        <textarea class="w-full h-full resize-none outline-none text-2xl font-tamil text-neutral placeholder:text-neutral-inactive" placeholder="பேசத் தொடங்க மைக்ரோஃபோன் பொத்தானை அழுத்தவும்..."></textarea>
                        
                        <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 flex flex-col items-center">
                            <div class="flex gap-3 mb-6 bg-canvas px-4 py-2 rounded-full border border-border shadow-sm">
                                <span class="text-xs font-semibold text-neutral-muted">ACCURACY: <span class="text-primary">98.4%</span></span>
                                <span class="text-xs font-semibold text-neutral-muted">|</span>
                                <span class="text-xs font-semibold text-neutral-muted">DIALECT: <span class="text-primary">STANDARD TAMIL</span></span>
                            </div>
                            <button id="mic-btn" class="w-20 h-20 bg-gradient-to-tr from-[#8b1e2b] to-[#c94555] rounded-full text-white shadow-xl flex items-center justify-center hover:scale-105 transition-all">
                                <span class="material-symbols-outlined text-4xl">mic</span>
                            </button>
                        </div>
                    </div>
                </div>
            \`,
            
            'learn-tamil': \`
                <div id="section-learn-tamil" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9] overflow-y-auto">
                    <header class="mb-8">
                        <h1 class="text-3xl font-bold text-neutral">Learn Tamil</h1>
                        <p class="text-neutral-muted mt-1">Interactive modules to master reading and writing</p>
                    </header>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <!-- Module 1 -->
                        <div class="bg-white rounded-xl shadow-sm border border-border overflow-hidden hover:shadow-md transition-shadow cursor-pointer">
                            <div class="h-32 bg-gradient-to-br from-orange-100 to-red-50 flex items-center justify-center">
                                <span class="text-6xl font-tamil text-primary font-bold">அ</span>
                            </div>
                            <div class="p-5">
                                <h3 class="text-lg font-semibold text-neutral">Uyir Ezhuthukkal</h3>
                                <p class="text-sm text-neutral-muted mt-1">Master the 12 primary vowels of the Tamil language.</p>
                                <div class="mt-4 flex justify-between items-center">
                                    <span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-1 rounded">100% Completed</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Module 2 -->
                        <div class="bg-white rounded-xl shadow-sm border border-border overflow-hidden hover:shadow-md transition-shadow cursor-pointer">
                            <div class="h-32 bg-gradient-to-br from-blue-100 to-indigo-50 flex items-center justify-center">
                                <span class="text-6xl font-tamil text-blue-800 font-bold">க்</span>
                            </div>
                            <div class="p-5">
                                <h3 class="text-lg font-semibold text-neutral">Mei Ezhuthukkal</h3>
                                <p class="text-sm text-neutral-muted mt-1">Learn the 18 consonants with interactive pronunciation.</p>
                                <div class="mt-4">
                                    <div class="w-full bg-canvas rounded-full h-2">
                                        <div class="bg-blue-500 h-2 rounded-full" style="width: 45%"></div>
                                    </div>
                                    <span class="text-xs font-medium text-neutral-muted mt-1 block">45% Completed</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Module 3 -->
                        <div class="bg-white rounded-xl shadow-sm border border-border overflow-hidden hover:shadow-md transition-shadow cursor-pointer">
                            <div class="h-32 bg-gradient-to-br from-purple-100 to-pink-50 flex items-center justify-center">
                                <span class="text-6xl font-tamil text-purple-800 font-bold">கா</span>
                            </div>
                            <div class="p-5">
                                <h3 class="text-lg font-semibold text-neutral">Uyirmei Ezhuthukkal</h3>
                                <p class="text-sm text-neutral-muted mt-1">Advanced compound letters combination rules.</p>
                                <div class="mt-4 flex justify-between items-center">
                                    <span class="text-xs font-bold text-neutral-muted bg-canvas border border-border px-2 py-1 rounded">Locked</span>
                                    <span class="material-symbols-outlined text-neutral-inactive">lock</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            \`,

            'typing-practice': \`
                <div id="section-typing-practice" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                    <header class="mb-6 flex justify-between items-center">
                        <div>
                            <h1 class="text-3xl font-bold text-neutral">Typing Practice</h1>
                            <p class="text-neutral-muted mt-1">Test your WPM speed on the Tamil99 layout</p>
                        </div>
                    </header>
                    <div class="flex-1 bg-white rounded-2xl shadow-sm border border-border p-8 flex flex-col">
                        <div class="flex justify-around items-center bg-canvas p-6 rounded-xl border border-border mb-8">
                            <div class="text-center">
                                <div class="text-4xl font-bold text-primary">0</div>
                                <div class="text-xs text-neutral-muted font-bold tracking-widest mt-1 uppercase">WPM</div>
                            </div>
                            <div class="w-px h-12 bg-border"></div>
                            <div class="text-center">
                                <div class="text-4xl font-bold text-neutral">100%</div>
                                <div class="text-xs text-neutral-muted font-bold tracking-widest mt-1 uppercase">Accuracy</div>
                            </div>
                            <div class="w-px h-12 bg-border"></div>
                            <div class="text-center">
                                <div class="text-4xl font-bold text-secondary">1:00</div>
                                <div class="text-xs text-neutral-muted font-bold tracking-widest mt-1 uppercase">Time Left</div>
                            </div>
                        </div>
                        
                        <div class="text-2xl leading-relaxed text-neutral-inactive font-tamil font-medium tracking-wide text-center max-w-4xl mx-auto mb-10 select-none">
                            <span class="text-neutral">தமிழ் மொழி மிகவும் தொன்மையான</span> மற்றும் இனிமையான மொழியாகும். இது திராவிட மொழிக்குடும்பத்தை சேர்ந்தது.
                        </div>
                        
                        <div class="relative max-w-2xl mx-auto w-full">
                            <input type="text" class="w-full text-2xl p-4 border-2 border-border-focus rounded-xl focus:outline-none focus:border-primary font-tamil text-center" placeholder="Type here to start the timer...">
                        </div>
                    </div>
                </div>
            \`,

            'gov-forms': \`
                <div id="section-gov-forms" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                    <header class="mb-8 flex justify-between items-center">
                        <div>
                            <h1 class="text-3xl font-bold text-neutral">Government Forms</h1>
                            <p class="text-neutral-muted mt-1">Quick-fill templates for official Tamil Nadu applications</p>
                        </div>
                        <div class="relative">
                            <span class="material-symbols-outlined absolute left-3 top-2.5 text-neutral-muted">search</span>
                            <input type="text" placeholder="Search forms..." class="pl-10 pr-4 py-2 rounded-lg border border-border focus:outline-none focus:border-primary">
                        </div>
                    </header>
                    <div class="flex-1 bg-white rounded-xl shadow-sm border border-border p-1 overflow-hidden">
                        <table class="w-full text-left">
                            <thead class="bg-canvas border-b border-border">
                                <tr>
                                    <th class="p-4 text-sm font-semibold text-neutral-muted">Form Name</th>
                                    <th class="p-4 text-sm font-semibold text-neutral-muted">Department</th>
                                    <th class="p-4 text-sm font-semibold text-neutral-muted">Last Updated</th>
                                    <th class="p-4"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="border-b border-border hover:bg-canvas transition-colors">
                                    <td class="p-4 font-medium text-neutral flex items-center gap-3">
                                        <span class="material-symbols-outlined text-red-500">picture_as_pdf</span>
                                        Ration Card Application (Form-1)
                                    </td>
                                    <td class="p-4 text-sm text-neutral-muted">Civil Supplies</td>
                                    <td class="p-4 text-sm text-neutral-muted">Oct 2026</td>
                                    <td class="p-4 text-right">
                                        <button class="text-primary text-sm font-semibold hover:underline">Auto-Fill</button>
                                    </td>
                                </tr>
                                <tr class="border-b border-border hover:bg-canvas transition-colors">
                                    <td class="p-4 font-medium text-neutral flex items-center gap-3">
                                        <span class="material-symbols-outlined text-red-500">picture_as_pdf</span>
                                        Community Certificate (OBC/SC/ST)
                                    </td>
                                    <td class="p-4 text-sm text-neutral-muted">Revenue Dept</td>
                                    <td class="p-4 text-sm text-neutral-muted">Sep 2026</td>
                                    <td class="p-4 text-right">
                                        <button class="text-primary text-sm font-semibold hover:underline">Auto-Fill</button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-canvas transition-colors">
                                    <td class="p-4 font-medium text-neutral flex items-center gap-3">
                                        <span class="material-symbols-outlined text-blue-500">description</span>
                                        Income Certificate Request
                                    </td>
                                    <td class="p-4 text-sm text-neutral-muted">Revenue Dept</td>
                                    <td class="p-4 text-sm text-neutral-muted">Aug 2026</td>
                                    <td class="p-4 text-right">
                                        <button class="text-primary text-sm font-semibold hover:underline">Auto-Fill</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            \`,

            'docs-pdf': \`
                <div id="section-docs-pdf" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                    <header class="mb-6 flex justify-between items-center">
                        <div>
                            <h1 class="text-3xl font-bold text-neutral">Documents & PDF</h1>
                            <p class="text-neutral-muted mt-1">Manage and export your saved Tamil documents</p>
                        </div>
                        <button class="px-4 py-2 bg-primary text-white rounded-lg font-medium shadow-md flex items-center gap-2 hover:bg-[#a62436] transition-colors">
                            <span class="material-symbols-outlined">upload_file</span> Import PDF
                        </button>
                    </header>
                    <div class="flex-1 grid grid-cols-4 gap-6">
                        <!-- Doc Cards -->
                        <div class="bg-white rounded-xl border border-border shadow-sm p-4 hover:shadow-md cursor-pointer flex flex-col items-center text-center">
                            <div class="w-20 h-24 bg-red-100 rounded mb-4 flex items-center justify-center border border-red-200">
                                <span class="material-symbols-outlined text-red-600 text-4xl">picture_as_pdf</span>
                            </div>
                            <h4 class="font-medium text-neutral text-sm truncate w-full">Letter_to_Editor.pdf</h4>
                            <p class="text-xs text-neutral-muted mt-1">12 KB • 2 days ago</p>
                        </div>
                        <div class="bg-white rounded-xl border border-border shadow-sm p-4 hover:shadow-md cursor-pointer flex flex-col items-center text-center">
                            <div class="w-20 h-24 bg-blue-100 rounded mb-4 flex items-center justify-center border border-blue-200">
                                <span class="material-symbols-outlined text-blue-600 text-4xl">description</span>
                            </div>
                            <h4 class="font-medium text-neutral text-sm truncate w-full">Tamil_Essay_Draft.docx</h4>
                            <p class="text-xs text-neutral-muted mt-1">45 KB • 1 week ago</p>
                        </div>
                        <div class="bg-white rounded-xl border border-border shadow-sm p-4 hover:shadow-md cursor-pointer flex flex-col items-center justify-center text-center border-dashed border-2 bg-canvas">
                            <span class="material-symbols-outlined text-4xl text-neutral-inactive mb-2">add</span>
                            <span class="text-sm font-medium text-neutral-muted">New Document</span>
                        </div>
                    </div>
                </div>
            \`
        };

        Object.keys(sectionsHTML).forEach(key => {
            mainArea.insertAdjacentHTML('beforeend', sectionsHTML[key]);
        });
    }

    // Interactive behaviors for the new robust modules
    const micBtn = document.getElementById('mic-btn');
    if (micBtn) {
        micBtn.addEventListener('click', function() {
            const isRecording = this.classList.contains('recording');
            if (isRecording) {
                this.classList.remove('recording', 'animate-bounce', 'bg-red-500');
                this.classList.add('bg-gradient-to-tr', 'from-[#8b1e2b]', 'to-[#c94555]');
                alert('Voice recording saved and translated.');
            } else {
                this.classList.add('recording', 'animate-bounce', 'bg-red-500');
                this.classList.remove('bg-gradient-to-tr', 'from-[#8b1e2b]', 'to-[#c94555]');
            }
        });
    }

    document.querySelectorAll('#section-gov-forms button, #section-learn-tamil .bg-white').forEach(el => {
        el.addEventListener('click', () => {
            // Visual click feedback
            el.style.opacity = '0.7';
            setTimeout(() => {
                el.style.opacity = '1';
                alert("Loading module resources...");
            }, 150);
        });
    });

    // Handle routing logic safely
    const sidebarLinks = document.querySelectorAll('aside a, aside [data-path]');
    sidebarLinks.forEach(link => {
        // Clear previous event listeners by cloning
        const newLink = link.cloneNode(true);
        link.parentNode.replaceChild(newLink, link);
        
        newLink.addEventListener('click', (e) => {
            const path = newLink.getAttribute('data-path') || newLink.innerText.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
            let targetSectionId = path;
            if (path.includes('learn-tamil')) targetSectionId = 'learn-tamil';
            if (path.includes('typing-practice')) targetSectionId = 'typing-practice';
            if (path.includes('government-forms') || path.includes('government')) targetSectionId = 'gov-forms';
            if (path.includes('documents') || path.includes('pdf')) targetSectionId = 'docs-pdf';

            if (path) {
                e.preventDefault();
                newLink.style.transform = 'scale(0.95)';
                setTimeout(() => newLink.style.transform = 'none', 100);

                setTimeout(() => {
                    if (path === 'tamil99-typing' || path === 'text-editor') {
                        window.location.href = '../tamil99_suite_typing_studio_ultra_premium/index.html';
                        return;
                    } 
                    if (path === 'english-to-tamil') {
                        window.location.href = '../fluent_tamil_precision/index.html';
                        return;
                    }
                    
                    const targetSection = document.getElementById(\`section-\${targetSectionId}\`);
                    
                    if (targetSection || targetSectionId === 'dashboard') {
                        document.querySelectorAll('.page-section').forEach(sec => sec.classList.add('hidden'));
                        
                        const sectionToShow = targetSectionId === 'dashboard' ? document.getElementById('section-dashboard') : targetSection;
                        if(sectionToShow) sectionToShow.classList.remove('hidden');

                        document.querySelectorAll('aside a, aside [data-path]').forEach(l => {
                            l.classList.remove('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                            l.classList.add('text-white/75', 'hover:bg-white/10');
                        });

                        newLink.classList.add('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                        newLink.classList.remove('text-white/75', 'hover:bg-white/10');
                    }
                }, 150);
            }
        });
    });
});
</script>
</body>
`;

// Replace older injected script
content = content.replace(/<script>\s*document\.addEventListener\('DOMContentLoaded', \(\) => \{\s*console\.log\("Ultimate Multi-Section Routing Engine Loaded"\);[\s\S]*?<\/script>\s*<\/body>/, productionPagesScript);

fs.writeFileSync(path, content);
console.log("Injected the Production Pages Engine with fully designed mockups.");
