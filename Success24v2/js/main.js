(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();

    // Initiate WOW.js
    new WOW().init();

    // Sticky Navbar (works on all devices)
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.navbar').addClass('sticky-top shadow-sm');
        } else {
            $('.navbar').removeClass('sticky-top shadow-sm');
        }
    });

    // Hero Header Carousel (made more mobile-friendly)
    $(".header-carousel").owlCarousel({
        animateOut: 'slideOutDown',
        items: 1,
        autoplay: true,
        smartSpeed: 1000,
        dots: true,
        loop: true,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        // Responsive options for better mobile handling
        responsive: {
            0: {  // Mobile
                nav: false,  // Hide nav arrows on very small screens to avoid overlap
                dots: true,
                touchDrag: true,  // Enable swipe
                mouseDrag: false
            },
            768: {  // Tablet+
                nav: true,
                touchDrag: true,
                mouseDrag: true
            }
        }
    });

    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });

        $('#videoModal').on('shown.bs.modal', function () {
            $("#video").attr('src', $videoSrc + "?autoplay=1&modestbranding=1&showinfo=0");
        });

        $('#videoModal').on('hide.bs.modal', function () {
            $("#video").attr('src', $videoSrc);
        });
    });

    // Facts Counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 5,
        time: 2000
    });

    // Back to Top Button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });

})(jQuery);


// Scroll Reveal Animation
function scrollReveal() {
    const reveals = document.querySelectorAll('.scroll-reveal, .scroll-fade-left, .scroll-fade-right, .scroll-scale');

    reveals.forEach(element => {
        const windowHeight = window.innerHeight;
        const elementTop = element.getBoundingClientRect().top;
        const elementVisible = 150;

        if (elementTop < windowHeight - elementVisible) {
            element.classList.add('active');
        }
    });
}

window.addEventListener('scroll', scrollReveal);
window.addEventListener('load', scrollReveal);

// Parallax Effect on Scroll
let lastScrollTop = 0;
window.addEventListener('scroll', function () {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    const parallaxElements = document.querySelectorAll('.parallax-bg');

    parallaxElements.forEach(element => {
        const speed = element.dataset.speed || 0.5;
        element.style.transform = `translateY(${scrollTop * speed}px)`;
    });

    lastScrollTop = scrollTop;
});

// Counter Animation
document.addEventListener("DOMContentLoaded", () => {
    const counters = document.querySelectorAll(".counter");
    let countersStarted = false;

    function startCounters() {
        if (countersStarted) return;

        counters.forEach(counter => {
            const target = +counter.getAttribute("data-target");
            let count = 0;
            const increment = Math.ceil(target / 200);
            const timer = setInterval(() => {
                count += increment;
                if (count >= target) {
                    counter.innerText = target;
                    clearInterval(timer);
                } else {
                    counter.innerText = count;
                }
            }, 5);
        });
        countersStarted = true;
    }

    // Start counters when they come into view
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                startCounters();
            }
        });
    }, { threshold: 0.5 });

    counters.forEach(counter => observer.observe(counter));
});

// Desktop Mega Menu
document.addEventListener("DOMContentLoaded", function () {
    const desktopBtn = document.getElementById("programBtnDesktop");
    const desktopMenu = document.getElementById("programMenu");

    if (desktopBtn && desktopMenu) {
        desktopBtn.addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            desktopMenu.classList.toggle("show");
        });

        document.addEventListener("click", function (e) {
            if (!desktopBtn.contains(e.target) && !desktopMenu.contains(e.target)) {
                desktopMenu.classList.remove("show");
            }
        });
    }

    // Mobile Submenu
    const mobileBtn = document.getElementById("programBtnMobile");
    const mobileMenu = document.getElementById("programMenuMobile");

    if (mobileBtn && mobileMenu) {
        mobileBtn.addEventListener("click", function (e) {
            e.preventDefault();
            mobileMenu.classList.toggle("hidden");
        });
    }
});

// Hide Spinner with fade effect
window.addEventListener("load", function () {
    const spinner = document.getElementById("spinner");
    if (spinner) {
        spinner.style.opacity = "0";
        spinner.style.transition = "opacity 0.5s ease";
        setTimeout(() => {
            spinner.classList.remove("show");
            spinner.style.display = "none";
        }, 500);
    }
});

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href !== '#' && href !== '') {
            e.preventDefault();
            const target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        }
    });
});

// Add scroll indicator for back-to-top button
const backToTop = document.querySelector('.animate-bounce-slow');
if (backToTop) {
    window.addEventListener('scroll', function () {
        if (window.pageYOffset > 300) {
            backToTop.style.opacity = '1';
            backToTop.style.visibility = 'visible';
        } else {
            backToTop.style.opacity = '0';
            backToTop.style.visibility = 'hidden';
        }
    });

    // Initially hide
    backToTop.style.opacity = '0';
    backToTop.style.visibility = 'hidden';
    backToTop.style.transition = 'opacity 0.3s, visibility 0.3s';
}