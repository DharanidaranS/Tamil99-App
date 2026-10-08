const fs = require('fs');
const path = 'tamil99_suite_dashboard_ultra_premium/index.html';

let content = fs.readFileSync(path, 'utf8');

// Remove any existing script at the end to keep it clean
const scriptsIndex = content.lastIndexOf('<script>');
if (scriptsIndex !== -1 && content.slice(scriptsIndex).includes('Production Pages Engine')) {
    content = content.substring(0, scriptsIndex) + '</body>\n</html>';
}

const finalScript = `
<script>
(function() {
    console.log("Production Pages Engine Loaded V2");
    
    function initDashboard() {
        const mainArea = document.querySelector('main') || document.querySelector('.flex-1');
        if (!mainArea) return;

        if (!document.getElementById('section-dashboard')) {
            const originalContent = Array.from(mainArea.children);
            const dashboardWrapper = document.createElement('div');
            dashboardWrapper.id = 'section-dashboard';
            dashboardWrapper.className = 'page-section w-full h-full';
            
            originalContent.forEach(child => {
                if (child.tagName !== 'SCRIPT') dashboardWrapper.appendChild(child);
            });
            mainArea.appendChild(dashboardWrapper);

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
                'text-editor': \`
                    <div id="section-text-editor" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                        <header class="mb-6 flex justify-between items-center">
                            <div>
                                <h1 class="text-3xl font-bold text-neutral">Text Editor</h1>
                                <p class="text-neutral-muted mt-1">Advanced bilingual word processing</p>
                            </div>
                            <button class="px-4 py-2 bg-primary text-white rounded-lg font-medium shadow-md flex items-center gap-2 hover:bg-[#a62436] transition-colors">
                                <span class="material-symbols-outlined">save</span> Save Document
                            </button>
                        </header>
                        <div class="flex-1 flex flex-col bg-white rounded-xl shadow-sm border border-border overflow-hidden">
                            <div class="border-b border-border bg-canvas p-2 flex items-center gap-1 flex-wrap">
                                <select class="border border-border rounded px-2 py-1 text-sm bg-white outline-none"><option>Noto Sans Tamil</option></select>
                                <select class="border border-border rounded px-2 py-1 text-sm bg-white outline-none"><option selected>14pt</option></select>
                                <div class="w-px h-6 bg-border mx-2"></div>
                                <button class="p-1.5 rounded hover:bg-white text-neutral-muted"><span class="material-symbols-outlined text-[18px]">format_bold</span></button>
                                <button class="p-1.5 rounded hover:bg-white text-neutral-muted"><span class="material-symbols-outlined text-[18px]">format_italic</span></button>
                                <button class="p-1.5 rounded hover:bg-white text-neutral-muted"><span class="material-symbols-outlined text-[18px]">format_underlined</span></button>
                            </div>
                            <div class="flex-1 p-8 bg-[#F8FAFC] overflow-y-auto flex justify-center">
                                <div class="w-full max-w-3xl bg-white shadow-md border border-border p-12 min-h-[800px] outline-none font-tamil text-neutral leading-relaxed" contenteditable="true">
                                    <h1 style="text-align: center; font-size: 24pt; font-weight: bold; margin-bottom: 20px;">தலைப்பு: தமிழ் மொழி</h1>
                                    <p style="text-indent: 40px; margin-bottom: 15px;">தமிழ் உலக மொழிகளில் மிகவும் பழமையானதும், தனித்தன்மை வாய்ந்ததும் ஆகும்.</p>
                                </div>
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
                            <div class="bg-white rounded-xl shadow-sm border border-border overflow-hidden hover:shadow-md transition-shadow cursor-pointer">
                                <div class="h-32 bg-gradient-to-br from-orange-100 to-red-50 flex items-center justify-center"><span class="text-6xl font-tamil text-primary font-bold">அ</span></div>
                                <div class="p-5"><h3 class="text-lg font-semibold text-neutral">Uyir Ezhuthukkal</h3><p class="text-sm text-neutral-muted mt-1">Master the 12 primary vowels.</p></div>
                            </div>
                        </div>
                    </div>
                \`,
                'typing-practice': \`
                    <div id="section-typing-practice" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                        <header class="mb-6 flex justify-between items-center">
                            <div>
                                <h1 class="text-3xl font-bold text-neutral">Typing Practice</h1>
                            </div>
                        </header>
                        <div class="flex-1 bg-white rounded-2xl shadow-sm border border-border p-8 flex flex-col">
                            <div class="flex justify-around items-center bg-canvas p-6 rounded-xl border border-border mb-8">
                                <div class="text-center"><div class="text-4xl font-bold text-primary">0</div><div class="text-xs text-neutral-muted font-bold tracking-widest mt-1 uppercase">WPM</div></div>
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
                            <div><h1 class="text-3xl font-bold text-neutral">Government Forms</h1></div>
                        </header>
                        <div class="flex-1 bg-white rounded-xl shadow-sm border border-border p-1 overflow-hidden">
                            <table class="w-full text-left">
                                <thead class="bg-canvas border-b border-border"><tr><th class="p-4 text-sm font-semibold">Form Name</th><th></th></tr></thead>
                                <tbody>
                                    <tr class="border-b border-border"><td class="p-4">Ration Card Application</td><td class="p-4 text-right"><button class="text-primary text-sm font-semibold hover:underline">Auto-Fill</button></td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                \`,
                'docs-pdf': \`
                    <div id="section-docs-pdf" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                        <header class="mb-6 flex justify-between items-center">
                            <div><h1 class="text-3xl font-bold text-neutral">Documents & PDF</h1></div>
                        </header>
                        <div class="flex-1 grid grid-cols-4 gap-6">
                            <div class="bg-white rounded-xl border border-border shadow-sm p-4 text-center"><div class="w-20 h-24 bg-red-100 rounded mb-4 mx-auto flex items-center justify-center border border-red-200"><span class="material-symbols-outlined text-red-600 text-4xl">picture_as_pdf</span></div><h4 class="font-medium text-neutral text-sm">Letter_to_Editor.pdf</h4></div>
                        </div>
                    </div>
                \`,
                'keyboard-api-sdk': \`
                    <div id="section-keyboard-api-sdk" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                        <header class="mb-6">
                            <h1 class="text-3xl font-bold text-neutral">Keyboard API & SDK</h1>
                            <p class="text-neutral-muted mt-1">Documentation and developer tools for the Tamil99 Engine.</p>
                        </header>
                        <div class="flex-1 bg-white rounded-xl shadow-sm border border-border p-8 flex items-center justify-center text-center">
                            <div>
                                <span class="material-symbols-outlined text-6xl text-primary/30 mb-4 block">api</span>
                                <h2 class="text-xl font-bold text-neutral">Developer Portal Coming Soon</h2>
                                <p class="text-neutral-muted mt-2 max-w-md mx-auto">Access to the native OS-level Keyboard Hook API and web SDKs will be available in the next release.</p>
                            </div>
                        </div>
                    </div>
                \`,
                'settings': \`
                    <div id="section-settings" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                        <header class="mb-6">
                            <h1 class="text-3xl font-bold text-neutral">Settings</h1>
                            <p class="text-neutral-muted mt-1">Configure your suite preferences and keyboard behavior.</p>
                        </header>
                        <div class="flex-1 bg-white rounded-xl shadow-sm border border-border p-8">
                            <div class="space-y-6 max-w-2xl">
                                <div class="flex items-center justify-between border-b border-border pb-4">
                                    <div><h3 class="font-bold text-neutral">Smart Ligature Resolution</h3><p class="text-sm text-neutral-muted">Automatically resolve complex Tamil character combinations.</p></div>
                                    <div class="w-10 h-6 bg-primary rounded-full relative"><div class="absolute right-1 top-1 w-4 h-4 bg-white rounded-full"></div></div>
                                </div>
                                <div class="flex items-center justify-between border-b border-border pb-4">
                                    <div><h3 class="font-bold text-neutral">Auto-Pulli (க்) Injection</h3><p class="text-sm text-neutral-muted">Inject Pulli automatically for consecutive consonants.</p></div>
                                    <div class="w-10 h-6 bg-primary rounded-full relative"><div class="absolute right-1 top-1 w-4 h-4 bg-white rounded-full"></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                \`,
                'help-support': \`
                    <div id="section-help-support" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">
                        <header class="mb-6">
                            <h1 class="text-3xl font-bold text-neutral">Help & Support</h1>
                            <p class="text-neutral-muted mt-1">Get assistance and read documentation.</p>
                        </header>
                        <div class="flex-1 bg-white rounded-xl shadow-sm border border-border p-8 flex items-center justify-center text-center">
                            <div>
                                <span class="material-symbols-outlined text-6xl text-primary/30 mb-4 block">support_agent</span>
                                <h2 class="text-xl font-bold text-neutral">Enterprise Support</h2>
                                <p class="text-neutral-muted mt-2 max-w-md mx-auto">Please contact your State Department IT Admin for technical assistance with the Tamil99 Suite.</p>
                                <button class="mt-6 px-6 py-2 bg-primary text-white rounded-lg shadow font-medium">Contact IT Desk</button>
                            </div>
                        </div>
                    </div>
                \`
            };

            Object.keys(sectionsHTML).forEach(key => {
                mainArea.insertAdjacentHTML('beforeend', sectionsHTML[key]);
            });
        }

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

        const sidebarLinks = document.querySelectorAll('aside a, aside [data-path]');
        sidebarLinks.forEach(link => {
            const newLink = link.cloneNode(true);
            link.parentNode.replaceChild(newLink, link);
            
            newLink.addEventListener('click', (e) => {
                const path = newLink.getAttribute('data-path');
                if (!path) return;
                
                e.preventDefault();
                newLink.style.transform = 'scale(0.95)';
                setTimeout(() => newLink.style.transform = 'none', 100);

                setTimeout(() => {
                    if (path === 'tamil99-typing') {
                        window.location.href = '../tamil99_suite_typing_studio_ultra_premium/index.html';
                        return;
                    } 
                    if (path === 'english-to-tamil') {
                        window.location.href = '../fluent_tamil_precision/index.html';
                        return;
                    }
                    
                    let targetSectionId = path;
                    if (path.includes('learn-tamil')) targetSectionId = 'learn-tamil';
                    if (path.includes('typing-practice')) targetSectionId = 'typing-practice';
                    if (path.includes('government-forms') || path.includes('government')) targetSectionId = 'gov-forms';
                    if (path.includes('documents') || path.includes('pdf')) targetSectionId = 'docs-pdf';
                    if (path.includes('text-editor')) targetSectionId = 'text-editor';
                    if (path.includes('voice-to-text')) targetSectionId = 'voice-to-text';

                    const targetSection = document.getElementById('section-' + targetSectionId);
                    
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
                    } else {
                        console.error('Target section not found:', targetSectionId);
                    }
                }, 150);
            });
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initDashboard);
    } else {
        initDashboard();
    }
    
    window.addEventListener('load', () => {
        if (window.location.hash) {
            const hashId = window.location.hash.substring(1);
            const targetSection = document.getElementById('section-' + hashId);
            if (targetSection || hashId === 'dashboard') {
                document.querySelectorAll('.page-section').forEach(sec => sec.classList.add('hidden'));
                const sectionToShow = hashId === 'dashboard' ? document.getElementById('section-dashboard') : targetSection;
                if(sectionToShow) sectionToShow.classList.remove('hidden');
                
                // Update active link in sidebar
                const matchingLink = Array.from(document.querySelectorAll('aside a, aside [data-path]')).find(l => {
                    const p = l.getAttribute('data-path');
                    if (!p) return false;
                    let ts = p;
                    if (p.includes('learn-tamil')) ts = 'learn-tamil';
                    if (p.includes('typing-practice')) ts = 'typing-practice';
                    if (p.includes('government-forms') || p.includes('government')) ts = 'gov-forms';
                    if (p.includes('documents') || p.includes('pdf')) ts = 'docs-pdf';
                    if (p.includes('text-editor')) ts = 'text-editor';
                    if (p.includes('voice-to-text')) ts = 'voice-to-text';
                    return ts === hashId;
                });
                
                if (matchingLink) {
                    document.querySelectorAll('aside a, aside [data-path]').forEach(l => {
                        l.classList.remove('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                        l.classList.add('text-white/75', 'hover:bg-white/10');
                    });
                    matchingLink.classList.add('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                    matchingLink.classList.remove('text-white/75', 'hover:bg-white/10');
                }
            }
        }
    });
})();
</script>
</body>
</html>
`;

content = content.replace('</body>\n</html>', finalScript);
fs.writeFileSync(path, content);
console.log("Successfully injected robust, fully encompassing pages engine.");
