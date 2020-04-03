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

$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#user-cover-img-prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#user-cover-img').change(function() {
    readURL(this);
  });
});

$(function() {
  $('#user-img').on('change', function(e) {
    if (e.target.files[0]) {
      $(this).parents('form').submit();
    }
  })
})