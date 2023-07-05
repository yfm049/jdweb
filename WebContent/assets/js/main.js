/*
Template Name: Corpboot
Template URI: http://www.templatespremium.net/corpboot/
Description: Corporate HTML5 Template based on Twitter Bootstrap.
Version: 1.9
Author: Rafael Memmel
Author URI: http://www.rafamemmel.com
*/
//===========================================================================================
//Get IE Version Function
//===========================================================================================
function getInternetExplorerVersion() {
    var rv = -1;
    if (navigator.appName == 'Microsoft Internet Explorer') {
        var ua = navigator.userAgent;
        var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null) {
            rv = parseFloat( RegExp.$1 );
        } 
    } else if (navigator.appName == 'Netscape') {
        var ua = navigator.userAgent;
        var re  = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null) {
            rv = parseFloat( RegExp.$1 );
        }
    }
  return rv;
}

//===========================================================================================
//Window Load Function
//===========================================================================================
$(window).load(function() {
    //---------------------------------------------------------------------------------------
    //Preloader
    //---------------------------------------------------------------------------------------
    if ($('#preloader').length) {
        var ie = getInternetExplorerVersion();
        if (ie == '-1' || ie == '11') {
            //Good Browsers
            $('#preloader').fadeOut('slow', function() {
                $(this).remove();
            });
            if(window.complete){
                $(window).trigger('load');
            }
        } else {
            //Older versions of Internet Explorer
            var myPreloader = document.querySelector('#preloader');
            myPreloader.style.display = 'none';
        }
    }
});
function baidu(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
}
//===========================================================================================
//Document Ready Function
//===========================================================================================
$(document).ready(function() {

    baidu();
    //---------------------------------------------------------------------------------------
    //CSS Animations
    //---------------------------------------------------------------------------------------
    var ie = getInternetExplorerVersion();
    if (ie == '-1' || ie == '11') {
        wow = new WOW({
            boxClass:     'wow',      // animated element css class (default is wow)
            animateClass: 'animated', // animation css class (default is animated)
            offset:       100,         // distance to the element when triggering the animation (default is 0)
            mobile: false             // trigger animations on mobile devices (true is default)
        })
        wow.init();
    }
    //---------------------------------------------------------------------------------------
    //Placeholder for IE old versions
    //---------------------------------------------------------------------------------------
    var ie = getInternetExplorerVersion();
    if (ie == '8' || ie == '9'  || ie == '10') {
        $('input, textarea').placeholder();
    }
    //---------------------------------------------------------------------------------------
    //Header Shrink
    //---------------------------------------------------------------------------------------
    if ($(window).width() > 800) {
        $(window).scroll(function() {
            if ($(document).scrollTop() < 120) {
                $('.navbar').removeClass('tiny');
            } else {
                $('.navbar').addClass('tiny');
            }
        });
    }
    //---------------------------------------------------------------------------------------
    //Scroll to Top
    //---------------------------------------------------------------------------------------
    if (($('.scrollToTop').length)) {
        /*Check to see if the window is top if not then display button*/
        $(window).scroll(function(){
            if ($(this).scrollTop() > 800) {
                $('.scrollToTop').fadeIn();
            } else {
                $('.scrollToTop').fadeOut();
            }
        });    
        /*Click event to scroll to top*/
        $('.scrollToTop').click(function(){
            $('html, body').animate({scrollTop : 0},800);
            return false;
        });
    }
    //---------------------------------------------------------------------------------------
    //Parallax
    //---------------------------------------------------------------------------------------
    $(window).stellar({
        horizontalScrolling: false,
        responsive: true/*,
        horizontalOffset: 0,
        verticalOffset: 0*/
    });
    //---------------------------------------------------------------------------------------
    //Flexslider
    //---------------------------------------------------------------------------------------
    if ($('#bg-slider').length) {
        /* Ref: https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties */
        $('#bg-slider').flexslider({
            animation: "fade",
            slideshow: true,
            animationLoop: true,
            directionNav: false, //remove the default direction-nav
            controlNav: false, //remove the default control-nav
            slideshowSpeed: 6000,
        });
    }
    if ($('#main-slider').length) {
        /* Ref: https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties */
        $('#main-slider').flexslider({
            animation: "fade",
            slideshow: true,
            animationLoop: true,
            directionNav: true, //remove the default direction-nav
            controlNav: true, //remove the default control-nav
            slideshowSpeed: 6000,
        });
    }
    //---------------------------------------------------------------------------------------
    //Slick Carousel
    //---------------------------------------------------------------------------------------
    if ($('#product').length) {
        $('#product').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            dots: true,
            arrows: false,
            autoplaySpeed: 8000,
            pauseOnHover: true,
            responsive: [
                {
                    breakpoint: 769,
                    settings: {
                        slidesToShow: 1
                    }
                }
            ]
        });
    }

    if ($('#news').length) {
        $('#news').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            dots: true,
            arrows: false,
            autoplaySpeed: 8000,
            pauseOnHover: true,
            responsive: [
                {
                    breakpoint: 769,
                    settings: {
                        slidesToShow: 1
                    }
                }
            ]
        });
    }
    if ($('#clients').length) {
        $('#clients').slick({
            infinite: true,
            slidesToShow: 6,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            pauseOnHover: true,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 4
                    }
                },
                {
                    breakpoint: 769,
                    settings: {
                        slidesToShow: 2
                    }
                },
                {
                    breakpoint: 481,
                    settings: {
                        arrows: false,
                        slidesToShow: 1
                    }
                }
            ]
        });
    }
    if ($('#team').length) {
        $('#team').slick({
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 10000,
            dots: true,
            arrows: false,
            pauseOnHover: true,
        });
    }
    //---------------------------------------------------------------------------------------
    //About Carousel
    //---------------------------------------------------------------------------------------
    var aboutCarouselClick = false;

    $('#aboutCarousel').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: false,
        autoplaySpeed: 10000,
        pauseOnHover: true,
        arrows: false,
        waitForAnimate: false,
        speed: 600,
        fade: true,
        centerPadding: 0
    }).on('beforeChange', function(e, slick, currentSlide, nextSlide){
        if(!aboutCarouselClick){
            $('#navAboutCarousel a').eq(nextSlide).trigger('click.bs');
        }
        else {
            aboutCarouselClick = false;
        }
    });

    $('#navAboutCarousel a').on('click.slick', function(e){
        aboutCarouselClick = true;
        var index = $(this).index('#navAboutCarousel a');
        $('#aboutCarousel').slick('slickGoTo', index);
        $(this).blur();
    });
    //---------------------------------------------------------------------------------------
    //Our history Carousel
    //---------------------------------------------------------------------------------------
    var historyCarouselClick = false;
    
    $('#historyCarousel').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 8000,
        pauseOnHover: true,
        arrows: false,
        waitForAnimate: false,
        speed: 600,
        fade: true,
        pauseOnHover: true
    }).on('beforeChange', function(e, slick, currentSlide, nextSlide){
        if(!historyCarouselClick){
            $('#navHistoryCarousel a').eq(nextSlide).trigger('click.bs');
        }
        else {
            historyCarouselClick = false;
        }
    });
    $('#navHistoryCarousel a').on('click.slick', function(e){
        historyCarouselClick = true;
        var index = $(this).index('#navHistoryCarousel a');
        $('#historyCarousel').slick('slickGoTo', index);
        $(this).blur();
    });
    //---------------------------------------------------------------------------------------
    //Vanillabox
    //---------------------------------------------------------------------------------------
    /* Ref: http://cocopon.me/app/vanillabox/demo.html */
    // Array of Vanillabox instances
    var boxes = [];

    if (($('.gallery').length)) {
        boxes.push($('.gallery').vanillabox({
            closeButton: true,
            keyboard: true
        }));
    }

    if (($('.lightbox').length)) {
        boxes.push($('.lightbox').vanillabox({
            closeButton: true,
            keyboard: true
        }));
    }

    if (($('.webpage').length)) {
        boxes.push($('.webpage').vanillabox({
            type: 'iframe',
            closeButton: true,
            keyboard: true
        }));
    }

    $(window).scroll(function(){
        if (($('.vnbx-frame').length)) {
            $('.vnbx-frame').css('top', ( $(window).height() - $('.vnbx-frame').height() ) / 3.2+$(window).scrollTop() + 'px');
        }
    });

    $(document).on('click', '.vnbx-mask', function() {
        boxes.forEach(function(box) {
            box.hide();
        });
    });
    //---------------------------------------------------------------------------------------
    //Video
    //---------------------------------------------------------------------------------------
    if ($('iframe').length) {
        $('iframe').each(function(){
            var ifr_source = $(this).attr('src');
            var wmode = '?wmode=transparent';
            $(this).attr('src',ifr_source+wmode);
        });
    }
    //---------------------------------------------------------------------------------------
    //Counter Up
    //---------------------------------------------------------------------------------------
    if ($('.count').length) {
        var countFlag = false;
        $(window).scroll(function(){
            var counterOffset = $('#counterUp').offset().top - 500;
            if ($(this).scrollTop() > counterOffset) {
                if(!countFlag) {
                    countFlag = true;
                    $('.count').each(function () {
                        $(this).prop('Counter',0).animate({
                            Counter: $(this).text()
                        }, {
                            duration: 3000,
                            easing: 'swing',
                            step: function (now) {
                                $(this).text(Math.ceil(now));
                            }
                        });
                    });
                }
            }
        });
    }
    //---------------------------------------------------------------------------------------
    //Portfolio
    //---------------------------------------------------------------------------------------
    if ($('#grid').length) {
        $('#grid').mixitup();
    }
    //---------------------------------------------------------------------------------------
    //Select
    //---------------------------------------------------------------------------------------
    if ($('.selectpicker').length) {
        $('.selectpicker').selectpicker({
            style: 'selectcorp'
        });
    }
    //---------------------------------------------------------------------------------------
    //Contact Form
    //---------------------------------------------------------------------------------------
    $('.contactform').on('submit', function() {
        if (!$(this).validate($('#alertform'))) {
            return false;
        }
    });
    //---------------------------------------------------------------------------------------
    //Google Maps
    //---------------------------------------------------------------------------------------
    if ($('#map-canvas').length) {
        var myLatLng = {lat: 40.7060555, lng: -74.0090263}; // Wall Street

        //Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map-canvas'), {
            center: myLatLng,
            scrollwheel: false,
            zoom: 16,
            styles: [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}]
        });

        //The Window it show after press click in marker icon
        var contentString = '<div id="mapcontent">'+'<h4 class="m0 color6">Hello!</h4><p>We are here...</p></div>';
        var infowindow = new google.maps.InfoWindow({
                maxWidth: 320,
                content: contentString
        });

        //The icon market
        var mapElement = document.getElementById('map-canvas');
        var map = new google.maps.Map(mapElement, map);
        var image = new google.maps.MarkerImage('assets/img/map.png',
            null, null, null, new google.maps.Size(32,32));

        //Create a marker and set its position.
        var marker = new google.maps.Marker({
            map: map,
            position: myLatLng,
            icon: image,
            title: 'Corpboot'
        });

        google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker);
        });
    }
    //---------------------------------------------------------------------------------------
    //Bootstrap Tooltip
    //---------------------------------------------------------------------------------------
    $('[data-toggle="tooltip"]').tooltip();
});


(function($) {
    $.extend($.fn, {
        validate: function(alertform) {
            var $el = $(this);
            var $inputs = $el.find('.required');
            var $first = null;
            $inputs.each(function() {
                $(this).off('keyup.validate change.validate blur.validate').on('keyup.validate change.validate blur.validate', function() {
                    if ($(this).val() === '') {
                        $(this).closest('div').closest('div').addClass('has-error');
                    }
                    else {
                        $(this).closest('div').removeClass('has-error');
                        $(alertform).fadeOut('fast');
                    }
                });

                if ($(this).val() === '') {
                    $(this).closest('div').addClass('has-error');
                    if ($first === null) {
                        $first = $(this);
                        $(alertform).html($(this).data('name') + " Field Should Not Be Empty!").fadeIn('fast');
                    }
                }
                else if ($(this).hasClass('required-email')) {
                    var email_exp = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                    if (!$(this).val().match(email_exp)) {
                        $(this).closest('div').addClass('has-error');
                        if ($first === null) {
                            $first = $(this);
                            $(alertform).html($(this).data('name') + " Is Not A Valid Email!").fadeIn('fast');
                        }
                    }
                }
                else {
                    $(this).closest('div').removeClass('has-error');
                }
            });

            if ($first !== null) {
                $first.focus();
                return false;
            }
            else {
                $(alertform).fadeOut('fast');
                return true;
            }
        }
    });
})(jQuery);

