const fs = require('fs');

const file = 'tamil99_suite_dashboard_ultra_premium/index.html';
let html = fs.readFileSync(file, 'utf8');

const oldSettingsStart = `'settings': \`
                    <div id="section-settings" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9]">`;

const newSettings = `'settings': \`
                    <div id="section-settings" class="page-section hidden w-full h-full flex flex-col p-8 bg-[#F1F5F9] overflow-y-auto">
                        <header class="mb-8">
                            <h1 class="text-3xl font-bold text-neutral tracking-tight">System Settings</h1>
                            <p class="text-neutral-muted mt-1 font-medium">Configure your suite preferences, theme, and keyboard behavior.</p>
                        </header>
                        <div class="flex-1 max-w-4xl space-y-6 pb-12">
                            
                            <!-- Appearance & General -->
                            <section class="bg-white rounded-2xl shadow-sm border border-border p-6">
                                <div class="flex items-center gap-3 mb-6">
                                    <span class="material-symbols-outlined text-primary text-2xl">palette</span>
                                    <h2 class="text-xl font-bold text-neutral">Appearance & General</h2>
                                </div>
                                <div class="space-y-5">
                                    <div class="flex items-center justify-between border-b border-border/50 pb-5">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Theme Preference</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Choose between Light, Dark, or sync with System.</p>
                                        </div>
                                        <div class="flex bg-canvas rounded-lg p-1 border border-border">
                                            <button class="px-4 py-1.5 rounded bg-white shadow-sm text-sm font-semibold text-primary">Light</button>
                                            <button class="px-4 py-1.5 rounded text-sm font-medium text-neutral-muted hover:text-neutral">Dark</button>
                                            <button class="px-4 py-1.5 rounded text-sm font-medium text-neutral-muted hover:text-neutral">System</button>
                                        </div>
                                    </div>
                                    <div class="flex items-center justify-between border-b border-border/50 pb-5">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Launch on Startup</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Automatically start the Tamil99 Engine when Windows boots.</p>
                                        </div>
                                        <div class="w-11 h-6 bg-primary rounded-full relative cursor-pointer shadow-inner"><div class="absolute right-1 top-1 w-4 h-4 bg-white rounded-full shadow"></div></div>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">System Tray Icon</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Show quick toggle icon in the Windows taskbar tray.</p>
                                        </div>
                                        <div class="w-11 h-6 bg-primary rounded-full relative cursor-pointer shadow-inner"><div class="absolute right-1 top-1 w-4 h-4 bg-white rounded-full shadow"></div></div>
                                    </div>
                                </div>
                            </section>

                            <!-- Keyboard Engine & Typing -->
                            <section class="bg-white rounded-2xl shadow-sm border border-border p-6">
                                <div class="flex items-center gap-3 mb-6">
                                    <span class="material-symbols-outlined text-primary text-2xl">keyboard</span>
                                    <h2 class="text-xl font-bold text-neutral">Keyboard Engine & Typing</h2>
                                </div>
                                <div class="space-y-5">
                                    <div class="flex items-center justify-between border-b border-border/50 pb-5">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Default Engine Layout</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Select your primary typing layout on launch.</p>
                                        </div>
                                        <select class="bg-canvas border border-border text-sm font-medium rounded-lg px-4 py-2 focus:outline-none focus:border-primary">
                                            <option>Tamil99 Direct</option>
                                            <option>Phonetic / Tanglish</option>
                                            <option>Bilingual (Auto-Detect)</option>
                                        </select>
                                    </div>
                                    <div class="flex items-center justify-between border-b border-border/50 pb-5">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Smart Ligature Resolution</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Automatically format complex Tamil character combinations instantly.</p>
                                        </div>
                                        <div class="w-11 h-6 bg-primary rounded-full relative cursor-pointer shadow-inner"><div class="absolute right-1 top-1 w-4 h-4 bg-white rounded-full shadow"></div></div>
                                    </div>
                                    <div class="flex items-center justify-between border-b border-border/50 pb-5">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Auto-Pulli (க்) Injection</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Inject Pulli automatically for consecutive consonants to speed up typing.</p>
                                        </div>
                                        <div class="w-11 h-6 bg-primary rounded-full relative cursor-pointer shadow-inner"><div class="absolute right-1 top-1 w-4 h-4 bg-white rounded-full shadow"></div></div>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Predictive Text & Auto-Complete</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Show AI-powered word suggestions above the text cursor.</p>
                                        </div>
                                        <div class="w-11 h-6 bg-slate-300 rounded-full relative cursor-pointer shadow-inner"><div class="absolute left-1 top-1 w-4 h-4 bg-white rounded-full shadow"></div></div>
                                    </div>
                                </div>
                            </section>

                            <!-- Shortcuts & Hotkeys -->
                            <section class="bg-white rounded-2xl shadow-sm border border-border p-6">
                                <div class="flex items-center gap-3 mb-6">
                                    <span class="material-symbols-outlined text-primary text-2xl">keyboard_command_key</span>
                                    <h2 class="text-xl font-bold text-neutral">Shortcuts & Hotkeys</h2>
                                </div>
                                <div class="space-y-4">
                                    <div class="flex items-center justify-between border border-border/60 rounded-xl p-4 bg-slate-50/50 hover:bg-slate-50 transition-colors">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Global Language Toggle</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Switch between English and Tamil instantly anywhere in Windows.</p>
                                        </div>
                                        <kbd class="px-3 py-1.5 bg-white border border-slate-300 rounded-lg shadow-sm font-mono text-sm font-bold text-slate-700">Win + Space</kbd>
                                    </div>
                                    <div class="flex items-center justify-between border border-border/60 rounded-xl p-4 bg-slate-50/50 hover:bg-slate-50 transition-colors">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Open Typing Studio</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Quickly launch the distraction-free typing studio.</p>
                                        </div>
                                        <kbd class="px-3 py-1.5 bg-white border border-slate-300 rounded-lg shadow-sm font-mono text-sm font-bold text-slate-700">Ctrl + Alt + T</kbd>
                                    </div>
                                    <div class="flex items-center justify-between border border-border/60 rounded-xl p-4 bg-slate-50/50 hover:bg-slate-50 transition-colors">
                                        <div>
                                            <h3 class="font-bold text-neutral text-sm">Voice-to-Text Dictation</h3>
                                            <p class="text-xs text-neutral-muted mt-0.5">Start listening for Tamil speech dictation.</p>
                                        </div>
                                        <kbd class="px-3 py-1.5 bg-white border border-slate-300 rounded-lg shadow-sm font-mono text-sm font-bold text-slate-700">Win + H</kbd>
                                    </div>
                                </div>
                            </section>

                            <!-- Account & Sync -->
                            <section class="bg-white rounded-2xl shadow-sm border border-border p-6">
                                <div class="flex items-center justify-between mb-6">
                                    <div class="flex items-center gap-3">
                                        <span class="material-symbols-outlined text-primary text-2xl">cloud_sync</span>
                                        <h2 class="text-xl font-bold text-neutral">Account & Cloud Sync</h2>
                                    </div>
                                    <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md bg-emerald-50 text-emerald-700 text-xs font-bold border border-emerald-200">
                                        <span class="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse"></span>
                                        Synced
                                    </span>
                                </div>
                                <div class="flex items-center p-4 bg-[#f8f0f1] rounded-xl border border-primary/20 gap-4">
                                    <div class="w-12 h-12 rounded-full bg-gradient-to-br from-primary to-[#6b0217] flex items-center justify-center text-white font-bold text-lg shadow-md">K</div>
                                    <div class="flex-1">
                                        <h3 class="font-bold text-neutral text-sm">Kavitha R.</h3>
                                        <p class="text-xs text-neutral-muted mt-0.5">kavitha.r@tn.gov.in (Enterprise License)</p>
                                    </div>
                                    <button class="px-4 py-2 border border-border bg-white rounded-lg text-sm font-semibold hover:bg-slate-50 transition-colors">Manage Account</button>
                                </div>
                                <div class="mt-5 flex items-center justify-between border-t border-border/50 pt-5">
                                    <div>
                                        <h3 class="font-bold text-neutral text-sm">Sync Custom Dictionary & Layouts</h3>
                                        <p class="text-xs text-neutral-muted mt-0.5">Keep your custom words and settings backed up to the TN Gov Intranet.</p>
                                    </div>
                                    <button class="text-primary text-sm font-bold hover:underline">Sync Now</button>
                                </div>
                            </section>
                            
                            <!-- Danger Zone -->
                            <section class="bg-white rounded-2xl shadow-sm border border-red-200 p-6">
                                <h2 class="text-lg font-bold text-red-600 mb-2">Danger Zone</h2>
                                <p class="text-xs text-neutral-muted mb-5">Irreversible destructive actions.</p>
                                <div class="flex items-center justify-between">
                                    <div>
                                        <h3 class="font-bold text-neutral text-sm">Factory Reset Suite</h3>
                                        <p class="text-xs text-neutral-muted mt-0.5">Erase all custom hotkeys, dictionaries, and local preferences.</p>
                                    </div>
                                    <button class="px-4 py-2 bg-red-50 text-red-600 border border-red-200 rounded-lg text-sm font-semibold hover:bg-red-100 transition-colors">Reset to Defaults</button>
                                </div>
                            </section>

                        </div>
                    </div>
                \``;

const settingsRegex = /'settings': `[\s\S]*?`,\n\s*'help-support'/;
if (html.match(settingsRegex)) {
    html = html.replace(settingsRegex, newSettings + ',\n                \'help-support\'');
    fs.writeFileSync(file, html);
    console.log('Successfully updated Settings block using Regex.');
} else {
    console.log('Regex did not match, attempting substring replacement...');
    const startIdx = html.indexOf(oldSettingsStart);
    if (startIdx !== -1) {
        const endIdx = html.indexOf(`</div>\n                \`,`, startIdx);
        if (endIdx !== -1) {
            html = html.substring(0, startIdx) + newSettings + html.substring(endIdx + 20);
            fs.writeFileSync(file, html);
            console.log('Successfully updated Settings block via substring replacement.');
        } else {
            console.error('Could not find end of old settings block.');
        }
    } else {
        console.error('Could not find old settings block start.');
    }
}
