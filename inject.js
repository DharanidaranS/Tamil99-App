const fs = require('fs');
const paths = [
    'fluent_tamil_precision/index.html',
    'tamil99_suite_dashboard_ultra_premium/index.html',
    'tamil99_suite_typing_studio_ultra_premium/index.html'
];
const script = `
<script>
document.addEventListener('DOMContentLoaded', () => {
    // Basic Interactivity Injection
    const buttons = document.querySelectorAll('button, a');
    buttons.forEach(btn => {
        btn.addEventListener('click', (e) => {
            if (btn.getAttribute('href') === '#') e.preventDefault();
            
            // Visual click feedback
            const originalTransform = btn.style.transform;
            btn.style.transform = 'scale(0.95)';
            btn.style.transition = 'transform 0.1s';
            
            setTimeout(() => {
                btn.style.transform = originalTransform || 'scale(1)';
            }, 150);
            
            // Tab switching simulation for elements in a list
            if (btn.closest('nav, [role="tablist"], aside')) {
                const parent = btn.parentElement;
                const siblings = parent.querySelectorAll('button, a');
                siblings.forEach(sib => {
                    sib.classList.remove('bg-primary', 'text-white', 'text-on-primary');
                    if(sib !== btn && sib.classList.contains('text-primary')) {
                       sib.classList.remove('text-primary');
                    }
                });
                btn.classList.add('bg-primary', 'text-white');
            }
        });
    });
});
</script>
</body>
`;

paths.forEach(p => {
    if (fs.existsSync(p)) {
        let content = fs.readFileSync(p, 'utf8');
        // Prevent multiple injections
        if (!content.includes('Basic Interactivity Injection')) {
            content = content.replace('</body>', script);
            fs.writeFileSync(p, content);
            console.log(`Injected script into ${p}`);
        }
    }
});
