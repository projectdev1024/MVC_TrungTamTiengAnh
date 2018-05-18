function loadMaps() {
    $('img#buildingimg').mapster({
        fillColor: '3dad65',
        fillOpacity: 0,
        stroke: false,
        singleSelect: true,
        clickNavigate: true
    });
}

$('#btn-goto-register-trial').click(function (e) {
    e.preventDefault();
    $('html,body').animate({ scrollTop: $('#register-couse-form').offset().top }, 1000);
});
$('.btn-register-course').on('click', function (e) {
    e.preventDefault();
    debugger
    var opset = $('#register-couse-form').offset().top;
    $('html,body').animate({
        scrollTop: opset
    }, 700);
});
$('#btn-show-fixed-side').click(function (e) {
    e.preventDefault();
    $('#fixed-side').stop(0).toggleClass('hide-side');
});
if ($(window).width() > 992) {
    $(window).scroll(function () {
        if ($(window).scrollTop() >= 385) {
            $('#fixed-side').stop(0).removeClass('hide-side');
        } else {
            $('#fixed-side').stop(0).addClass('hide-side');
        }
    });
}
$(window).resize(function () {
    if ($(window).width() <= 992) {
        $('#fixed-side').stop(0).addClass('hide-side');
    } else {
        $(window).scroll(function () {
            if ($(window).scrollTop() >= 385) {
                $('#fixed-side').stop(0).removeClass('hide-side');
            } else {
                $('#fixed-side').stop(0).addClass('hide-side');
            }
        });
    }
});
if ($(window).width() < 992) {
    $('#sticker-content').mmenu({
        "dropdown": true,
        extensions: ["pagedim-black", "border-full", "effect-panels-zoom", "effect-menu-fade", 'pageshadow'],
        searchfield: false,
        counters: true,
    }, {
        clone: true
    });
}

$('img.lazy').lazyload();
var wow = new WOW({
    boxClass: 'wow',      // default
    animateClass: 'animated', // default
    offset: 0,          // default
    mobile: false,       // default
    live: true        // default
});
wow.init();
$('#main-slider .owl-carousel').owlCarousel({
    items: 1,
    smartSpeed: 800,
    autoplayTimeout: 4000,
    autoplayHoverPause: true,
    loop: true,
    autoplay: true,
    autoHeight:true,
    onInitialize: function () {
        if ($(window).width() > 992) {
            $('#main-slider .item').height($(window).width() * 0.33);
        } else {
            $('#main-slider .item').each(function () {
                if (typeof $(this).find('.dibien').children('img').attr('src') === 'undefined') {
                    console.log($(this).find('.dibien').children('img').attr('src'));
                    $(this).height($(window).width() * 0.33);
                }
            });
        }
    },
    onTranslate: function () {
        $('#main-slider .owl-carousel .wow').each(function () {
            var $this = $(this);
            $this.removeClass('animated');
            $this.removeAttr('style');
            wow = new WOW({
                boxClass: 'wow',      // default
                animateClass: 'animated', // default
                offset: 0,          // default
                mobile: true,       // default
                live: true        // default
            });
            wow.init();
        });
    }
});
var owl = $('.video-slider .owl-carousel').owlCarousel({
    smartSpeed: 800,
    margin: 10,
    stagePadding: 30,
    dots: false,
    nav: true,
    navText: ["<i class='fa fa-arrow-circle-o-left'></i>", "<i class='fa fa-arrow-circle-o-left'></i>"],
    responsive: {
        0: {
            items: 1
        },
        320: {
            items: 2
        },
        768: {
            items: 3
        },
        992: {
            items: 4
        },
        1200: {
            items: 5
        }
    }
});
$('.video-detail .video-slider .item a').click(function (e) {
    e.preventDefault();
    var src = $(this).attr('href');
    $('.video-detail .video-view').attr('src', src);
});

$('.video-slider:after').click(function () {
    owl.trigger('next.owl.carousel', [300]);
});
// Go to the previous item
$('.video-slider:before').click(function () {
    owl.trigger('prev.owl.carousel', [300]);
});
$('.why').each(function () {
    $(this).height($(this).width());
});

$('.block-slider:not(.picture-slider) .owl-carousel').owlCarousel({
    items: 1,
    smartSpeed: 450,
    dots: true,
    nav: true,
    navText: ['', ''],
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
    loop: true,
    autoHeight: true,
    autoplay: true,
    onInitialized: function ($this) {
        customBlockSliderPager($this);
    }
});
function customBlockSliderPager($this) {
    var paginationLinks = $($this.target).find('.owl-dots .owl-dot span');
    $(paginationLinks).each(function (i, v) {
        $(v).html((i + 1).toString());
    });
}
$('.block-slider.picture-slider .owl-carousel').owlCarousel({
    responsive: {
        0: {
            items: 1,
            margin: 0
        },
        500: {
            items: 2,
            margin: 10
        },
        992: {
            items: 3,
            margin: 12
        },
        1280: {
            items: 4,
            margin: 12
        }
    },
    smartSpeed: 450,
    dots: false,
    nav: true,
    navText: ['', ''],
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
    loop: true,
    autoplay: true,
    onInitialized: function () {
        $('.block-slider.picture-slider').magnificPopup({
            delegate: '.zoom',
            type: 'image',
            tLoading: 'Loading image #%curr%...',
            mainClass: 'mfp-img-mobile',
            gallery: {
                enabled: true,
                navigateByImgClick: true,
                preload: [0, 1]
            }
        });
    }
});

$('.playvideo').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,
    fixedContentPos: false,
    iframe: {
        patterns: {
            youtube: {
                index: 'youtube.com/',
                id: 'v=',
                src: 'http://www.youtube.com/embed/%id%?autoplay=1'
            }
        }
    }
});

$('.datepicker').datepicker({
    language: "vi",
    orientation: "bottom left",
    autoclose: true,
    todayHighlight: 'TRUE'
});
$('[data-toggle="gmap"]').click(function (e) {
    e.preventDefault();
    var iframeSrc = $(this).attr('href');
    var location = $(this).attr('title');
    $('[data-remodal-id="gmap-modal"]').find('iframe').attr('src', iframeSrc);
    $('[data-remodal-id="gmap-modal"]').find('h2').html(location);
    $('[data-remodal-id="gmap-modal"]').remodal({ hashTracking: false }).open();
});

$(document).on('closed', '[data-remodal-id="gmap-modal"]', function (e) {
    $(this).find('iframe').attr('src', '');
    $(this).find('iframe').html('');
    $(this).find('h2').html('');
});
$('.payment-method-list>li>label').click(function () {
    var $this = $(this);
    if ($this.find('input[type="radio"]').is(":checked")) {
        return;
    }
    var target = $this.data('target');
    $('.payment-content .payment-tab').stop(0).hide(0, function () {
        $(target).stop(0).fadeIn(0);
    });
})

// active menu
$('.main-menu li a').each(function () {
    if (this.href.trim() == window.location)
        $(this).parent('li').addClass('active');
});
$('.sub li a').each(function () {
    if (this.href.trim() == window.location) {
        $(this).parents('ul.main-menu li').addClass('active');
    }
});
$(document).ready(function () {
    var a = window.location.pathname;
    if (a == "/") {
        $('.main-menu li:nth-of-type(2)').addClass("active");
    }
});
function get_cookie(cookieName) {
    var results = document.cookie.match('(^|;) ?' + cookieName + '=([^;]*)(;|$)');
    if (results)
        return (unescape(results[2]));
    else
        return null;
}
$(function () {
    $("#en").click(function (e) {
        debugger
        e.preventDefault();
        if (get_cookie('lang') == "en") {
            return;
        }
        $.ajax({
            type: "POST",
            url: "/changelanguage",
            data: { lang: "en", url: "" }
        })
            .done(function (data) {
                window.location.href = data;
            });
    });
    $("#vi").click(function (e) {
        e.preventDefault();
        if (get_cookie('lang') == "vi") {
            return;
        }
        $.ajax({
            type: "POST",
            url: "/changelanguage",
            data: { lang: "vi", url: "" }
        })
            .done(function (data) {
                window.location.href = data;
            });
    });
});

if ($(window).width() <= 992) {
    $('.wrap-text table').each(function() {
        $(this).wrap('<div class="table-responsive"></div>');
    });
    $('.wrap-text .table-responsive').mCustomScrollbar({
        axis: "x", // horizontal scrollbar
        theme: "dark",
        alwaysShowScrollbar:2
    });
}

$(".subject-detail .img img").elevateZoom({ zoomWindowFadeIn: 500, zoomWindowFadeOut: 500, lensFadeIn: 500, lensFadeOut: 500, zoomWindowWidth: 300, zoomWindowHeight: 300, scrollZoom: true,lensSize:500 });