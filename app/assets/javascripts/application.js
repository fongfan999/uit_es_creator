// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here usGiâya relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require easypie
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

  // Hide countdown block
  $('.close-countdown').click(function(e) {
    e.preventDefault();
    $('#countdown').fadeOut("slow").remove();
  });

  if ($('#countdown').length > 0) {
    var date = "27 January 2017 23:59:59";

    setInterval(function(){
      function getTimeNow(){
        var d = new Date();
        return d.getTime();
      }

      eventDate = Date.parse(date) / 1e3;
      currentDate = getTimeNow() / 1e3;
      seconds = eventDate - currentDate;

      days = Math.floor(seconds / 86400);
      seconds -= days * 60 * 60 * 24;

      if (days < 0) {
        return;
      }

      hours = Math.floor(seconds / 3600);
      seconds -= hours * 60 * 60;

      minutes = Math.floor(seconds / 60);
      seconds -= minutes * 60;

      seconds = Math.round(seconds);

      $('.days span').text(days);
      $('.days').data('easyPieChart').update( Math.floor(days * 100 / 10) );

      $('.hours span').text(hours);
      $('.hours').data('easyPieChart').update( Math.floor(hours * 100 / 24 ) );

      $('.minutes span').text(minutes);
      $('.minutes').data('easyPieChart').update(
        Math.floor(minutes * 100 / 60 )
      );

      $('.seconds span').text(seconds);
      $('.seconds').data('easyPieChart').update(
        Math.floor(seconds * 100 / 60)
      );
    }, 1000);
  }
});

$(function() {
  $('.chart').easyPieChart({
    scaleColor: false,
    trackColor: 'rgba(255,255,255,0.3)',
    barColor: '#E7F7F5',
    lineWidth: 6,
    lineCap: 'butt',
    size: 150
  });
})

