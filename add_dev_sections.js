const fs = require('fs');

const file = 'tamil99_suite_dashboard_ultra_premium/index.html';
let html = fs.readFileSync(file, 'utf8');

const missingSections = `
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
                \`,
`;

// Insert right after `const sectionsHTML = {`
html = html.replace('const sectionsHTML = {', 'const sectionsHTML = {\n' + missingSections);

fs.writeFileSync(file, html);
console.log('Appended developer sections to sectionsHTML object.');
