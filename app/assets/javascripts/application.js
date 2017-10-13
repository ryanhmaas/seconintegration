// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require jquery.easy-autocomplete
//= require popper
//= require bootstrap-sprockets
//= require_tree .

// document ready
$(document).ready(function () {

    /*---------- Responsive Nav -----------*/

    // on button click
    $("#topbar-nav__hamburger").click(function () {
        $("#topbar-nav__linkset").slideToggle();
    });

    // kill jQuery styling on resize
    $(window).on("resize", function () {
        if ($(window).width() > 1200) {
            $('#topbar-nav__linkset').css('display', '');
        }
    }).resize();


    
    /*---------- Responsive Search -----------*/

    // on button click
    $(".topbar-nav__link-search, .topbar-nav__link-search--mobile").click(function () {
        $(".topbar-nav__search-bar").slideToggle();
        $(".topbar-nav__search-bar").focus();
    });

    // kill jQuery styling on resize
    $(window).on("resize", function () {
        if ($(window).width() > 1200) {
            $('.topbar-nav__search-bar').css('display', '');
        }
    }).resize();
    
    
    
    /*---------- Responsive Footer -----------*/
    
    $(".footer__link-header-wrapper").click(function () {
        event.preventDefault();
        
        if ($(this).next(".footer__link-wrapper").hasClass("footer__open-link")) {
            $(this).next(".footer__link-wrapper").removeClass("footer__open-link");
        } else {
            $(this).next(".footer__link-wrapper").addClass("footer__open-link");
        }
        
    });
});
