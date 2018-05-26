
$(document).ready(function () {

    // FOR SCROLL ANIMATIONS
    window.scrollReveal = new scrollReveal();

    // SCROLL SCRIPTS 
    $('.scroll-me a').bind('click', function (event) { //just pass scroll-me class and start scrolling
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1000, 'easeInOutQuad');
        event.preventDefault();
    });
});