(function () {
    console.log("Unified Routing Engine Loaded");

    function initRouting() {
        const sidebarLinks = document.querySelectorAll('a[data-path], button[data-path], [data-path]');
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
                    // Detect current page
                    const isDashboard = !!document.querySelector('meta[content="web_dashboard"]') || window.location.pathname.includes('dashboard');

                    // If navigating to main apps
                    if (path === 'tamil99-typing') {
                        if (!window.location.pathname.includes('typing_studio')) {
                            window.location.href = '../tamil99_suite_typing_studio_ultra_premium/index.html';
                        }
                        return;
                    }
                    if (path === 'english-to-tamil') {
                        if (!window.location.pathname.includes('fluent_tamil')) {
                            window.location.href = '../fluent_tamil_precision/index.html';
                        }
                        return;
                    }
                    if (path === 'dashboard') {
                        if (!isDashboard) {
                            window.location.href = '../tamil99_suite_dashboard_ultra_premium/index.html';
                        } else {
                            showDashboardSection('dashboard');
                        }
                        return;
                    }

                    // Dashboard internal sections
                    let targetSectionId = path;
                    if (path.includes('learn-tamil')) targetSectionId = 'learn-tamil';
                    if (path.includes('typing-practice')) targetSectionId = 'typing-practice';
                    if (path.includes('government-forms') || path.includes('government')) targetSectionId = 'gov-forms';
                    if (path.includes('documents') || path.includes('pdf')) targetSectionId = 'docs-pdf';
                    if (path.includes('text-editor')) targetSectionId = 'text-editor';
                    if (path.includes('voice-to-text')) targetSectionId = 'voice-to-text';

                    if (!isDashboard) {
                        // Redirect to dashboard with a hash to open that section (optional, or just to dashboard)
                        window.location.href = '../tamil99_suite_dashboard_ultra_premium/index.html#' + targetSectionId;
                        return;
                    }

                    showDashboardSection(targetSectionId, newLink);
                }, 150);
            });
        });

        // Handle hash navigation if arriving on dashboard
        if (window.location.hash) {
            const hashId = window.location.hash.substring(1);
            showDashboardSection(hashId);
        }
    }

    function showDashboardSection(targetSectionId, activeLinkElement = null) {
        const targetSection = document.getElementById('section-' + targetSectionId);
        if (targetSection || targetSectionId === 'dashboard') {
            document.querySelectorAll('.page-section').forEach(sec => sec.classList.add('hidden'));

            const sectionToShow = targetSectionId === 'dashboard' ? document.getElementById('section-dashboard') : targetSection;
            if (sectionToShow) sectionToShow.classList.remove('hidden');

            document.querySelectorAll('a[data-path], button[data-path], [data-path]').forEach(l => {
                l.classList.remove('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                l.classList.add('text-white/75', 'hover:bg-white/10');
            });

            if (activeLinkElement) {
                activeLinkElement.classList.add('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                activeLinkElement.classList.remove('text-white/75', 'hover:bg-white/10');
            } else {
                // Find matching link
                const link = document.querySelector(`aside [data-path="${targetSectionId}"]`) || document.querySelector(`aside [data-path*="${targetSectionId}"]`);
                if (link) {
                    link.classList.add('bg-gradient-to-r', 'from-[#8b1e2b]', 'via-[#6f121d]', 'to-[#4c0913]', 'shadow-[0_4px_16px_rgba(139,30,43,0.4)]', 'border-[#d4af37]/30', 'text-white');
                    link.classList.remove('text-white/75', 'hover:bg-white/10');
                }
            }
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initRouting);
    } else {
        initRouting();
    }
})();
initRouting();
    }
}) ();
