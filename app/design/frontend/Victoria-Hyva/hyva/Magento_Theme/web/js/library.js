(function () {
    window.myFormAnimations = {
        init(form) {
            const inputs = form.querySelectorAll('.js-post-input');

            inputs.forEach(input => {
                input.addEventListener('focus', () => {
                    input.style.transition = 'all 0.3s ease';
                    input.style.transform = 'scale(1.2)';
                    input.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
                });

                input.addEventListener('blur', () => {
                    input.style.transform = 'scale(1.1)';
                    input.style.boxShadow = 'none';
                });
            });
        }
    };
})();
