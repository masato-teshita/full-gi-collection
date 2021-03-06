$(document).on('click', function(e) {
  if ($(e.target).closest('.js-user-nav').length) {
    $(this).find('ul').show();
  } else {
    $('.user-nav-popup').hide();
  }
})

$(function() {
  $('#clip-post').on('click', function(e){
    e.preventDefault(); 
    
    const user_id = $('#clip-post').find('.clip-path').val();
    const shop_id = $('#clip-post').find('.shop-id').val();
    const url = `/users/${user_id}/clips`
    const shop_url = location.href

    if (url !== '') {
      $('body').append('<div id="modalWrap" />');
      var modalThis = $('#target_msg_box')
      var wrap = $('#modalWrap'); wrap.fadeIn('200');
  
      modalThis.fadeIn('200');
  
      function mdlHeight() {
        var wh = $(window).innerHeight();
        var attH = modalThis.find('.modal-inner').innerHeight();
        modalThis.css({ height: attH });
      }
      mdlHeight();
      $(window).on('resize', function () {
        mdlHeight();
      });
      function clickAction() {
        modalThis.fadeOut('200');
        wrap.fadeOut('200', function () {
          wrap.remove();
        });
      }
      //wrapクリックされたら 
      wrap.on('click', function () {
        clickAction(); return false;
      });
      //2秒後に消える 
      setTimeout(clickAction, 2000);

      setTimeout(function(){
        $.ajax({
          url: url,
          type: "POST",
          data: {
                  user_id: user_id,
                  shop_id: shop_id
                },
          dataType: 'html',
        })
        .done(function(data){
          window.location = shop_url;
        })
      }, 500);
    }
    return false;
  });
});