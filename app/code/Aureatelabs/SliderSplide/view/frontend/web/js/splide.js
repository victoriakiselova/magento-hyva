document.addEventListener('alpine:init', () => {
    window.initSplide = (el) => {
        new Splide(el, {
            type       : 'loop',
            perPage    : 3,
            perMove    : 1,
            gap        : '2rem',
            pagination : false,
            omitEnd: true,
            arrows     : true,
            breakpoints : {
                1024: { perPage: 3 },
                768 : { perPage: 2 },
                480 : { perPage: 1 },
            },
        }).mount();
    };
});
