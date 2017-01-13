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
  // Preloader icon
  $(".se-pre-con").fadeOut("fast");

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
    // 70%
    if ($(this).text().trim() === 'keyboard_arrow_right') {
      $('#content').css('width', '100%');
      $('#toggle-width i').text('keyboard_arrow_left');
    } else {
      $('#content').css('width', '70%');
      $('#toggle-width i').text('keyboard_arrow_right');
    }
  });

  // Handdle showing notifications
  $('#show-notifs').click(function() {
    $('.modal').modal({
      ready: function() {
        $('ul.tabs').tabs();
      }
    });

    $('.tooltipped').tooltip('remove');
    $('#show-notifs-content').modal('open');
  });

  // Submit when student id length is 8
  $('#student-id').bind('change keyup', function() {
    if ($(this).val().length === 8) {
      $(this).closest('form').submit();
    }
  });

});

