import * as bootstrap from "bootstrap"

console.log('hey!')

// Famous v1.1
$(document).ready(function () {

  $('.navbar-toggler').on('click', function (e) {
    e.preventDefault();
    $('.navbar').addClass('sticky');
  });

  // Carousel
  var $item = $('.carousel-item');
  var $wHeight = $(window).height();
  $item.eq(0).addClass('active');
  $item.height($wHeight);
  $item.addClass('full-screen');

  $('.carousel img').each(function () {
    var $src = $(this).attr('src');
    var $color = $(this).attr('data-color');
    $(this).parent().css({
      'background-image': 'url(' + $src + ')',
      'background-color': $color
    });
    $(this).remove();
  });

  $(window).on('resize', function () {
    $wHeight = $(window).height();
    $item.height($wHeight);
  });

  $('.carousel').carousel({
    interval: 3000  // Adjust the interval to your preference (in milliseconds)
  });
  console.log('Hello World from Webpacker 3')
});
