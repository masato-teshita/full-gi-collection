$(function(){
  $('.js-user-nav').on('click',function(){
    console.log("OK")
    $(this).next('ul').slideToggle();
    });
});

$(function() {
  $('.action-btn').on('click', function() {
    $('.action-modal-wrapper').show();
    $('.action-modal').show();
    $().show();
    if ($(this).hasClass('wom-post-btn')) {
      $('.wom-form').show();
    } else {
      $('.bookmark-notif').show();
    }
  });
});

$(document).on('click', '.action-modal-wrapper, .modal-times, .wom-send-btn', function() {
  $('.action-modal-wrapper').hide();
  $('.action-modal').hide();
  $('.wom-form').hide();
  $('.bookmark-notif').hide();
})