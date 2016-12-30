// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

  $('.persistent').click(function(e) {
    e.preventDefault();
  });

  $(document).scroll(function() {
    if ($(window).scrollTop() == 0) {
      $('nav.teal').addClass('z-depth-0');
    } else {
      $('nav.teal').removeClass('z-depth-0');
    }
  });

  $('#toggle-width').click(function() {
    // 2 blocks
    if ($(this).text().trim() === 'keyboard_arrow_right') {
      $('#toggle-width i').text('keyboard_arrow_left');
      $('#us-creator').removeClass('l7').addClass('l12');
      $('#notifs').removeClass('l5').addClass('l12');
    } else {
      $('#toggle-width i').text('keyboard_arrow_right');
      $('#us-creator').removeClass('l12').addClass('l7');
      $('#notifs').removeClass('l12').addClass('l5');
    }
  });

  $(".se-pre-con").fadeOut("fast");
  
});

