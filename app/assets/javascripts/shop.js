$(function(){
  $('.js-user-nav').on('click',function(){
    console.log("OK")
    $(this).next('ul').slideToggle();
    });
});