$(function() {
  $('.user-icon').on('click', function(){
    $('#user-img').click();
  });  
});

$(function() {
  var h = $('.wrapper').height();
  var h_total = $(window).height();
  var h_def = h_total - 224;
  if (h < h_def) {
    $('.wrapper').height(h_def)
  }
});