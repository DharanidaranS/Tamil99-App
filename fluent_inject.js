const fs = require('fs');
const path = 'fluent_tamil_precision/index.html';

let content = fs.readFileSync(path, 'utf8');

const fluentScript = `
<script>
document.addEventListener('DOMContentLoaded', () => {
    console.log("Fluent Tamil Precision Interactivity Loaded");
    
    // Find the textarea
    const textarea = document.querySelector('textarea');
    
    // Handle Sidebar Buttons
    const sidebarButtons = document.querySelectorAll('aside button');
    sidebarButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active state from all
            sidebarButtons.forEach(b => {
                b.classList.remove('bg-white', 'shadow-fluent-dock');
                b.classList.add('text-neutral-muted', 'hover:bg-white/50');
                const icon = b.querySelector('.material-symbols-outlined');
                if (icon) icon.classList.remove('text-primary');
            });
            // Add active state to clicked
            btn.classList.add('bg-white', 'shadow-fluent-dock');
            btn.classList.remove('text-neutral-muted', 'hover:bg-white/50');
            const activeIcon = btn.querySelector('.material-symbols-outlined');
            if (activeIcon) activeIcon.classList.add('text-primary');
            
            // Visual click feedback
            const originalTransform = btn.style.transform;
            btn.style.transform = 'scale(0.95)';
            setTimeout(() => { btn.style.transform = originalTransform || 'scale(1)'; }, 100);
        });
    });

    // Handle Top Toggle Buttons (Anjal / Tamil99)
    const toggleButtons = document.querySelectorAll('header .flex.gap-2 button');
    toggleButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            toggleButtons.forEach(b => {
                b.className = "px-4 py-1.5 rounded-md bg-canvas text-neutral-muted text-sm font-medium transition-colors";
            });
            btn.className = "px-4 py-1.5 rounded-md bg-primary text-white text-sm font-medium shadow-sm transition-colors";
        });
    });

    // Handle Candidate Ribbon Clicks (Typing Simulation)
    const candidateKeys = document.querySelectorAll('.candidate-key');
    candidateKeys.forEach(key => {
        const parentDiv = key.closest('div.cursor-pointer');
        if(parentDiv) {
            parentDiv.addEventListener('click', () => {
                if(textarea) {
                    textarea.value += key.innerText + ' ';
                }
                
                // Visual feedback for the ribbon key
                const originalBg = parentDiv.style.backgroundColor;
                parentDiv.style.backgroundColor = '#e2e8f0'; // Flash gray
                setTimeout(() => {
                    parentDiv.style.backgroundColor = originalBg || '';
                }, 150);
            });
        }
    });
});
</script>
</body>
`;

// Replace the old injected script or just closing body
if (content.includes('Basic Interactivity Injection')) {
    content = content.replace(/<script>\s*document\.addEventListener\('DOMContentLoaded', \(\) => \{\s*\/\/ Basic Interactivity Injection[\s\S]*?<\/script>\s*<\/body>/, fluentScript);
} else {
    content = content.replace('</body>', fluentScript);
}

fs.writeFileSync(path, content);
console.log("Updated fluent_tamil_precision/index.html with working scripts.");
