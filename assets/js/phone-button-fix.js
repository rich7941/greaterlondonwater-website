// Fix phone button hover color on location pages
// This script overrides inline styles that can't be overridden with CSS

document.addEventListener('DOMContentLoaded', function() {
    // Find the phone button
    const phoneButton = document.querySelector('.phone-number a');
    
    if (phoneButton) {
        // Create a style element to inject the correct hover styles
        const style = document.createElement('style');
        style.textContent = `
            .phone-number a:hover {
                background-color: var(--primary-color) !important;
                color: white !important;
            }
        `;
        
        // Add the style to the head
        document.head.appendChild(style);
        
        // Also directly override any inline styles on hover
        phoneButton.addEventListener('mouseenter', function() {
            this.style.setProperty('background-color', 'var(--primary-color)', 'important');
            this.style.setProperty('color', 'white', 'important');
        });
        
        phoneButton.addEventListener('mouseleave', function() {
            // Reset to normal state
            this.style.setProperty('background-color', 'var(--accent-color)', 'important');
            this.style.setProperty('color', 'white', 'important');
        });
    }
});
