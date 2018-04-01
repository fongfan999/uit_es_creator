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

$(document).on("turbolinks:click", function(){
  $(".se-pre-con").show();
});

$(document).on("turbolinks:load", function(){
  $(".se-pre-con").fadeOut(50);
});

$(document).on('turbolinks:load', function() {
  $('.persistent').click(function(e) {
    e.preventDefault();
  });

  $('.modal').modal();

  // Submit when student id length is 8
  $('#student-id').bind('change keyup', function() {
    if ($(this).val().length >= 8) {
      $(".se-pre-con").show();
      $(this).closest('form').submit();
    }
  });

  initializeCountdown();
});


var intervalId;
var initializeCountdown = function() {
  if ($('#countdown').length > 0) {
    var date = parseInt($('#countdown').data('next-es'));

    window.clearInterval(intervalId);
    intervalId = window.setInterval(function(){
      function getTimeNow() {
        var d = new Date();
        return d.getTime();
      }

      eventDate = date / 1e3;
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
      $('.days').data('easyPieChart').update( Math.floor(days * 100 / 30) );

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

    $('.chart').easyPieChart({
      scaleColor: false,
      trackColor: 'rgba(255,255,255,0.3)',
      barColor: '#E7F7F5',
      lineWidth: 6,
      lineCap: 'butt',
      size: 150
    });
  }
}
