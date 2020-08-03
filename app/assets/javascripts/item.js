$(function() {
  const explanation_tab = $('#item_explanation_tab')
  const explanation_box =$('#item_explanation_box')
  const size_tab = $('#item_size_tab')
  const size_box = $('#item_size_box')

  explanation_tab.on('click', function() {
    explanation_tab.addClass('selected_tab')
    explanation_box.addClass('active_box')
    size_tab.removeClass('selected_tab')
    size_box.removeClass('active_box')
  });

  size_tab.on('click', function() {
    size_tab.addClass('selected_tab')
    size_box.addClass('active_box')
    explanation_tab.removeClass('selected_tab')
    explanation_box.removeClass('active_box')
  });
});

$(function() {
  const slider = "#slider_images";
  const sliderImages = "#slider_images .slider_image"
  const thumbnailImages = "#thumb_images .thumb_image";
  let image_index;
  let index;

  // 画像にindexを振る
  $(thumbnailImages).each(function() {
    image_index = $(thumbnailImages).index(this);
    if (image_index == 0) {
      $(this).addClass("thumbnail-current")
    }
    $(this).attr("data-index", image_index);
  });

  // 画像のindexをもとに、サムネイルで選択中の画像にクラスを付与
  $(slider).on('init', function(slick) {
    index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
    $(thumbnailImages+'[data-index="'+index+'"]').addClass("thumbnail-current");
   });
 
  $(slider).css('opacity',0);
  $(slider).animate({'z-index':1}, 300,function(){
    $(slider).slick({
      prevArrow:'<i class="fa fa-angle-left arrow arrow-left"></i>',
      nextArrow:'<i class="fa fa-angle-right arrow arrow-right"></i>',
      fade: true,
      infinite: true,
    });
    $(slider).animate({'opacity':1});
  });

  //サムネイル画像アイテムをクリックしたときにスライダー切り替え
  $(thumbnailImages).on('click', function(){
    index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });

  //サムネイル画像のクラスを切り替え
  $(slider).on('beforeChange',function(event, slick, currentSlide, nextSlide){
    $(thumbnailImages).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailImages+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });

  // モーダルの挙動
  $('[data-modal="overlay"], [data-modal="content"]').hide();
  
  const modal_slider = "#slider_images_modal"

  $(sliderImages).on('click', function() {
    index = Number($(this).attr("data-slick-index"))
    $(modal_slider).slick({
      prevArrow: '<i class="fa fa-angle-left arrow arrow-left"></i>',
      nextArrow: '<i class="fa fa-angle-right arrow arrow-right"></i>',
      dots: true,
      speed: 800,
      initialSlide: index
    });
    posi = $(window).scrollTop();
    $('[data-modal="fixed"]').css({
      position: 'fixed',
      top: -1 * posi
    });
    $('[data-modal="overlay"], [data-modal="content"]').fadeIn();
    $(modal_slider).css('opacity',0);
    $(modal_slider).animate({'z-index':1},500,function(){
      $(modal_slider).slick('setPosition');
      $(modal_slider).animate({'opacity':1});
    });
  });
  
  $('.js_modal_close, [data-modal="overlay"]').on('click', function(){
    $('[data-modal="fixed"]').attr('style', '');
    $('html, body').prop({scrollTop: posi});
    $('[data-modal="overlay"], [data-modal="content"]').fadeOut();
    $(modal_slider).slick('unslick')
  });
});
