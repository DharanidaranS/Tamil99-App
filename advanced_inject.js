const fs = require('fs');
const path = 'tamil99_suite_typing_studio_ultra_premium/index.html';

let content = fs.readFileSync(path, 'utf8');

const advancedScript = `
<script>
document.addEventListener('DOMContentLoaded', () => {
    console.log("Advanced Interactivity Loaded for Typing Studio");
    
    // 1. Handle all interactive elements (buttons, links, clickable divs)
    const interactables = document.querySelectorAll('button, a, [role="button"], .cursor-pointer, .hover\\\\:bg-surface-container-high, .hover\\\\:bg-surface-container-highest');
    
    // Attempt to find a target for typing
    const typingTarget = document.querySelector('textarea, input[type="text"], [contenteditable="true"]') || document.createElement('textarea');
    
    if(!document.contains(typingTarget)) {
        // If no typing area exists, find a good place to inject one
        typingTarget.className = "w-full h-48 p-4 mt-4 rounded-xl border border-primary text-xl font-tamil";
        typingTarget.placeholder = "Typing output will appear here...";
        
        // Find the main content area (heuristically)
        const main = document.querySelector('main') || document.body;
        main.insertBefore(typingTarget, main.firstChild);
    }

    interactables.forEach(el => {
        el.addEventListener('click', (e) => {
            // Prevent default jumps for empty links
            if (el.tagName === 'A' && el.getAttribute('href') === '#') e.preventDefault();
            
            // Visual click feedback
            const originalTransform = el.style.transform;
            el.style.transform = 'scale(0.95)';
            el.style.transition = 'transform 0.1s';
            
            setTimeout(() => {
                el.style.transform = originalTransform || 'scale(1)';
            }, 100);

            // Tab switching logic
            if (el.closest('nav, [role="tablist"], aside, .flex.items-center.gap-space-sm')) {
                const parent = el.parentElement;
                const siblings = parent.querySelectorAll('a, button, div');
                siblings.forEach(sib => {
                    if (sib !== el) {
                        sib.classList.remove('bg-primary', 'text-white', 'text-on-primary', 'shadow-md');
                        sib.classList.add('text-on-surface-variant');
                    }
                });
                
                el.classList.add('bg-primary', 'text-white', 'shadow-md');
                el.classList.remove('text-on-surface-variant');
            }
            
            // If it looks like a keyboard key (has a single character or short text), type it!
            const textContent = el.innerText.trim();
            if (textContent.length > 0 && textContent.length <= 3 && !el.closest('nav, aside')) {
                typingTarget.value = (typingTarget.value || '') + textContent;
                if(typingTarget.tagName !== 'TEXTAREA' && typingTarget.tagName !== 'INPUT') {
                    typingTarget.innerText += textContent;
                }
            }
        });
    });
});
</script>
</body>
`;

if (!content.includes('Advanced Interactivity Loaded')) {
    content = content.replace('</body>', advancedScript);
    fs.writeFileSync(path, content);
    console.log("Injected advanced script.");
}
