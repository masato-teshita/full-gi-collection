$(function() {
  $('.item_box__right__detail__title--tab').on('click', function() {
    $('.item_box__right__detail__title--tab').removeClass('selected_detail');
    $(this).addClass('selected_detail');
  });
});