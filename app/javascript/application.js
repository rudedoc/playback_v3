import * as bootstrap from "bootstrap"

console.log('hey!')

// Famous v1.1
$(document).ready(function () {

  $('.navbar-toggler').on('click', function (e) {
    e.preventDefault();
    $('.navbar').addClass('sticky');
  });

  console.log('Hello World from Webpacker 3')
});
