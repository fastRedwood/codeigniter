define(function(require, exports, module) {

    require('retina');
    require('detect');
    require('jquery.appear');
    require('jquery.sidr');
    require('jquery.isotope');
    require('jquery.parallax');
    require('scrollTo');
    require('photosetGrid');
    require('jquery.fancySelect');

    exports.run = function() {      
      var scrollRefresh = {
              pastTop: false,
              pastBottom: false,
              previous: 0,
              bottom: function(callback) {
                var pBottom = $(window).height() + $(window).scrollTop() >= $(document).height();
                if(!this.pastBottom && pBottom) {
                  callback($(window).height() + $(window).scrollTop());
                  this.pastBottom = true;
                } else {
                  if(!pBottom) this.pastBottom = false;
                }
                this.previous = $(window).scrollTop();
              },
              top: function(callback) {
                var pTop = $(window).scrollTop() < this.scrollPrevious && $(window).scrollTop <= 0;
                if(!this.pastTop && pTop) {
                  callback($(window).scrollTop());
                  this.pastTop = true;
                } else {
                  if(!pTop) this.pastTop = false;
                }
                this.previous = $(window).scrollTop();
              }
            }
            
       $(window).scroll(function () {

            // Show header when scrolled a little from top
            if ($(document).scrollTop() == 0) {
              $('.header.sliding').removeClass('header-shrink');
            } else {
              $('.header.sliding').addClass('header-shrink');
            }
            
            // Blog Header Shrink
            if ($(document).scrollTop() == 0) {
              $('.header.shortme').removeClass('header-short');
            } else {
              $('.header.shortme').addClass('header-short');
            }

            // Hide header when scrolled to the end of site
            scrollRefresh.top(function(pos) {
              console.log("Loading top. " + pos);
              $('.header').addClass('header-shrink');
            });
            scrollRefresh.bottom(function(pos) {
              console.log("Loading bottom. " + pos);
              $('.header').removeClass('header-shrink');
            });
            
        });


       ;
        (function ($) {
            var $body = $('body'),
                $pageslide = $('#pageslide');
            var _sliding = false,
                _lastCaller;
            if ($pageslide.length == 0) {
                $pageslide = $('<div />').attr('id', 'pageslide').css('display', 'none').appendTo($('body'));
            }

            function _load(url, useIframe) {
                if (url.indexOf("#") === 0) {
                    $(url).clone(true).appendTo($pageslide.empty()).show();
                }
                else {
                    if (useIframe) {
                        var iframe = $("<iframe />").attr({
                            src: url,
                            frameborder: 0,
                            hspace: 0
                        }).css({
                            width: "100%",
                            height: "100%"
                        });
                        $pageslide.html(iframe);
                    }
                    else {
                        $pageslide.load(url);
                    }
                    $pageslide.data('localEl', false);
                }
            }

            function _start(direction, speed) {
                var slideWidth = $pageslide.outerWidth(true),
                    bodyAnimateIn = {}, slideAnimateIn = {};
                if ($pageslide.is(':visible') || _sliding) return;
                _sliding = true;
                switch (direction) {
                case 'left':
                    $pageslide.css({
                        left: 'auto',
                        right: '-' + slideWidth + 'px'
                    });
                    slideAnimateIn['right'] = '+=' + slideWidth;
                    $('html,body').css("overflow", "hidden");
                    $('body').removeClass("scrollable");
                    break;
                default:
                    $pageslide.css({
                        left: '-' + slideWidth + 'px',
                        right: 'auto'
                    });
                    slideAnimateIn['left'] = '+=' + slideWidth;
                    $('html,body').css("overflow", "hidden");
                    $('body').removeClass("scrollable");
                    break;
                }
                $body.animate(bodyAnimateIn, speed);
                $pageslide.show().animate(slideAnimateIn, speed, function () {
                    _sliding = false;
                });

            }

            $.fn.pageslide = function (options) {
                var $elements = this;
                $elements.click(function (e) {
                    var $self = $(this),
                        settings = $.extend({
                            href: $self.attr('href')
                        }, options);
                    e.preventDefault();
                    e.stopPropagation();
                    if ($pageslide.is(':visible') && $self[0] == _lastCaller) {
                        $.pageslide.close();
                    }
                    else {
                        $.pageslide(settings);
                        _lastCaller = $self[0];
                    }
                });
            };
            $.fn.pageslide.defaults = {
                speed: 300,
                direction: 'right',
                modal: false,
                iframe: true,
                href: null
            };
            $.pageslide = function (options) {
                var settings = $.extend({}, $.fn.pageslide.defaults, options);
                if ($pageslide.is(':visible') && $pageslide.data('direction') != settings.direction) {
                    $.pageslide.close(function () {
                        _load(settings.href, settings.iframe);
                        _start(settings.direction, settings.speed);
                    });
                }
                else {
                    _load(settings.href, settings.iframe);
                    if ($pageslide.is(':hidden')) {
                        _start(settings.direction, settings.speed);
                    }
                }
                $pageslide.data(settings);
            }
            $.pageslide.close = function (callback) {
                var $pageslide = $('#pageslide'),
                    slideWidth = $pageslide.outerWidth(true),
                    speed = $pageslide.data('speed'),
                    bodyAnimateIn = {}, slideAnimateIn = {}
                if ($pageslide.is(':hidden') || _sliding) return;
                _sliding = true;
                switch ($pageslide.data('direction')) {
                case 'left':
                    bodyAnimateIn['margin-left'] = 0;
                    slideAnimateIn['right'] = '-=' + slideWidth;
                    $('html,body').css("overflow", "visible");
                    $('body').addClass("scrollable");
                    break;
                default:
                    bodyAnimateIn['margin-left'] = 0;
                    slideAnimateIn['left'] = '-=' + slideWidth;
                    $('html,body').css("overflow", "visible");
                    $('body').addClass("scrollable");
                    break;
                }
                $pageslide.animate(slideAnimateIn, speed);
                $body.animate(bodyAnimateIn, speed, function () {
                    $pageslide.hide();
                    _sliding = false;
                    if (typeof callback != 'undefined') callback();
                });
            }
            $pageslide.click(function (e) {
                e.stopPropagation();
            });
            $(document).bind('click keyup', function (e) {
                if (e.type == "keyup" && e.keyCode != 27) return;
                if ($pageslide.is(':visible') && !$pageslide.data('modal')) {
                    $.pageslide.close();
                }
            });
        })(jQuery);

        //custom
        /* Preloader
        ================================================== */
        $(window).load(preLoader);
        function preLoader() {
          setTimeout(function() {
            $("#preloader").delay(250).fadeOut({
              duration: 750,
            });
          }, 250);
        }

        $(document).ready(function(){

          /* Enable Touch in PageSlide 
          ================================================== */
          $('body').on('touchmove', function (e) {
            if (!$('.scrollable').has($(e.target)).length) e.preventDefault();
          });
          
          /* Fullwidth and height intro
          ================================================== */
          $(function(){
            var windowH = $(window).height();
            var wrapperH = $('.full').height();
            if(windowH > wrapperH) {                            
              $('.full').css({'height':($(window).height())+'px'});
            }                                                                               
            $(window).resize(function(){
              var windowH = $(window).height();
              var wrapperH = $('.full').height();
              var differenceH = windowH - wrapperH;
              var newH = wrapperH + differenceH;
              var truecontentH = $('.truecontent').height();
              if(windowH > truecontentH) {
                $('.full').css('height', (newH)+'px');
              }
            })          
          });

          
          /* Responsive Menu
          ================================================== */
            $('#mobile-menu').sidr({
            name: 'sidr-main',
            source: '.header',
            renaming: false
            });

          /* Parallax Elements
          ================================================== */
          $('.home').parallax("50%", 0.2);
          $('.services').parallax("50%", 0.3);
          $('.buynow').parallax("50%", 0.1);
          $('.post_header').parallax("50%", 0.3);

          /* Close Sidr after click on page content
          ================================================== */
          $('#main, footer').click(function(){
            $.sidr('close', 'sidr-main');
          });
          
          /* PageSlide Modal Portfolio Page 
          ================================================== */
          $(".page").pageslide({
            direction: "left",
            modal: true,
            iframe: false
          });
          
          /* Fancy Select
          ================================================== */
          $('.budget').fancySelect();
          
          /* Window Scrolling
          ================================================= */
          var $scrllink = $('.scrollink');
          $scrllink.scrollTo({ 
            offset: -60,
            speed: 600
          });
          if ($(window).width() < 768) {
            $scrllink.scrollTo({ 
              offset: 0,
              speed: 600
            });
          }
          
          /* Fade elements while scrolling
          ================================================= */
          jQuery(function($) {
            var divs = $('.fade-that');
            $(window).on('scroll', function() {
              var st = $(this).scrollTop();
              divs.css({ 
                'opacity' : 1 - st/500
              }); 
            });
          });
          
        });// End of doc ready

          
        $(window).load(function() {

          /* Isotope Portfolio
          ================================================= */
          var $container = $('#portfolio-container');

          $container.isotope({
            resizable: false,
            itemSelector : ".item",
            masonry : {
              columnWidth : 1,
              gutterWidth: 1,
            }
            
          });

          var $optionSets = $('.option-set'),
              $optionLinks = $optionSets.find('li');

          $optionLinks.click(function() {
            var $this = $(this);
            if ($this.hasClass('selected')) {
              return false;
            }
            var $optionSet = $this.parents('.option-set');
            $optionSet.find('.selected').removeClass('selected');
            $this.addClass('selected');
          });

          $('#filters').on('click', 'a', function() {
            var selector = $(this).data('filter');
            $container.isotope({filter: selector});

          });
          
          $(window).resize(function(){
            $('#portfolio-container').isotope('reLayout');
          });

        });

        $(window).resize(function(){

          /* Centering elements horizontally and vertically
          ================================================= */
          $('#intro').css({
            position:'absolute',
            left: ($(window).width() - $('#intro').outerWidth())/2,
            top: ($(window).height() - $('#intro').outerHeight())/2
          });
          
          $('#footer').css({
            position:'fixed',
            left: ($(window).width() - $('#footer').outerWidth())/2,
            top: ($(window).height() - $('#footer').outerHeight())/2
          });
          
          /* Close Sidr menu when window is resized
          ================================================= */
          $.sidr('close', 'sidr-main');
          
          /* Animations 
          ================================================= */
          if(!jQuery.browser.mobile) {
            $(function() {

              
              // Team Members
              $('.team_member').appear();

              $(document.body).on('appear', '.team_member', function() {
                $(this).addClass('animated');
              });
              
              // Services
              $('.services .services_list ul li').appear();

              $(document.body).on('appear', '.services .services_list ul li', function() {
                $(this).addClass('animated');
              });
              
              // Portfolio
              $('.item').appear();

              $(document.body).on('appear', '.item', function() {
                $(this).addClass('animated');
              });
              
              // Contact
              $('.field').appear();

              $(document.body).on('appear', '.field', function() {
                $(this).addClass('animated');
              });
              
            });
          }

        });

        // To initially run the function:
        $(window).resize();

    };

});