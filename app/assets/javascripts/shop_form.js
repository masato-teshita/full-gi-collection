// ページ遷移後のfocusを画像選択にする動作
// $(function() {
//   $('.input-area').focus();
// });


// 入力フォームのバリデーション
// $(function() {
//   let value;
//   let next;
//   let priceNext;
//   let imageNext;

//   // blur時の動作
//   function fieldBlur(input) {
//     value = input.val();
//     next = input.next();
//     priceNext = input.parent().parent().next();
//     // 未入力のチェック
//     if (value == "" && !next.hasClass('error')) {
//       input.addClass('error');
//       if (input.is('select')) {
//         input.after(`<p class='error'>選択してください</p>`);
//       } else if (input.is('#sell-price-input') || input.is('.img-file')) {
//         ;
//       } else {
//         input.after(`<p class='error'>入力してください</p>`);  
//       }
//     } else {
//       input.removeClass('error');
//       next.remove();
//     }

//     // 金額入力の入力チェック
//     if (input.is('#sell-price-input')) {
//       if (value == "" || value < 300 || value >= 10000000) {
//         if (!priceNext.hasClass('error')) {
//           input.parent().parent().after(`<p class='error price-error'>300以上10,000,000未満で入力してください</p>`);
//         }
//       } else if (priceNext.hasClass('error')) {
//         priceNext.remove();
//       } else {
//         ;
//       }
//     }
//   }
//   // keyup時の動作
//   function fieldKeyup(input) {
//     value = input.val();
//     next = input.next();
//     priceNext = input.parent().parent().next();
//     if (value != "") {
//       input.removeClass('error');
//       if (input.is('#sell-price-input')) {
//         ;
//       } else {
//         next.remove();
//       }
//     }
//     // 金額入力の入力チェック
//     if (input.is('#sell-price-input')) {
//       if (value >= 300 && value < 10000000) {
//         if (priceNext.hasClass('error')) {
//           priceNext.remove();
//         }
//       } else if (!priceNext.hasClass('error')) {
//         input.parent().parent().after(`<p class='error price-error'>300以上10,000,000未満で入力してください</p>`);
//       } else {
//         ;
//       }
//     }
//   }

//   // 画像の入力チェック
//   function imageCheck(num) {
//     const imageNext = $('#image-box-1').next();
//     if (num == 0) {
//       if (!imageNext.hasClass('error')) {
//         $('#image-box-1').after(`<p class='error'>画像がありません</p>`);
//       }
//     } else {
//       if (imageNext.hasClass('error')) {
//         imageNext.remove();
//       }
//     }
//   }

//   $('#new_item input:required').on('blur', function() {
//     fieldBlur($(this));
//   });

//   $('#new_item input:required').on('keyup', function() {
//     fieldKeyup($(this));
//   });

//   $('#new_item textarea').on('blur', function() {
//     fieldBlur($(this));
//   });

//   $('#new_item textarea').on('keyup', function() {
//     fieldKeyup($(this));
//   });

//   $('#new_item select').on('blur change', function() {
//     fieldBlur($(this));
//   });

//   // 出品ボタン押下時の処理
//   $('.item-btn').click(function(e) {
//     e.preventDefault();
//     const submitID = $(this).attr('id')
//     let flag = true;
//     const num = $('.item-image').length - 1
//     imageCheck(num);

//     $('#new_item input:required').each(function(e) {
//       if ($('#new_item input:required').eq(e).val() === "") {
//         fieldBlur($('#new_item input:required').eq(e));
//         flag = false;
//       }
//     });
//     $('#new_item textarea:required').each(function(e) {
//       if ($('#new_item textarea:required').eq(e).val() === "") {
//         fieldBlur($('#new_item textarea:required').eq(e));
//         flag = false;
//       }
//     });
//     $('#new_item select').each(function(e) {
//       if ($('#new_item select').eq(e).val() === "") {
//         fieldBlur($('#new_item select').eq(e));
//         flag = false;
//       }
//     });

//     if (flag) {
//       if (submitID == 'item-post-btn') {
//         $("input[name='item[trading_status_id]']").val(1);
//         $('#new_item').submit();
//       } else {
//         $("input[name='item[trading_status_id]']").val(4);
//         $('#new_item').submit();
//       }
//     } else {
//       $(this).off('submit');
//       $('body,html').animate({ scrollTop: 0 }, 500);
//       return false;
//     }
//   });
// });


// 画像のプレビュー、ドラッグ等の処理に関する動作
$(function(){
  let imageNext;
  let fileIndex = 0;
  // 画像プレビュー関数
  function imagePreview(src, filename, i, num) {
    const html= `
      <div class='shop-image' data-image="${filename}" data-index="${i}">
        <div class='shop-image__content'>
          <div class='shop-image__content--icon'>
            <img src=${src} width="118" height="80" index="${i}">
          </div>
        </div>
        <div class='shop-image__operation'>
          <div class='shop-image__operation--delete'>削除</div>
        </div>
      </div>
      `
    $('#image-box__container').before(html);
    $('#image-box__container').attr('class', `shop-num-${num}`) 
  }

  // 画像追加時のエラーチェック関数
  function errorCheckOnAdd() {
    imageNext = $('#image-box').next();
    if (imageNext.hasClass('error')) {
      imageNext.remove();
    }
  }
  // 画像削除時のエラーチェック動作
  function errorCheckOnDel(num) {
    imageNext = $('#image-box').next();
    if (num == 0) {
      if (!imageNext.hasClass('error')) {
        $('#image-box').after(`<p class='error'>画像がありません</p>`);
      }  
    }
  }

  //DataTransferオブジェクトで、データを格納する箱を作る
  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  const file_field = document.querySelector('input[type=file]')

  //fileが選択された時に発火するイベント
  $(document).on('change', '.img-file', function(){
    errorCheckOnAdd();

    //選択したfileのオブジェクトをpropで取得
    const files = $('input[type="file"]').prop('files')[0];
    const currentNum = $('.shop-image').length
    const add_files_length = file_field.files.length
    const inputNum = currentNum + add_files_length

    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      
      const num = $('.shop-image').length + i + 1
      fileReader.readAsDataURL(file);
    //画像が10枚になったら超えたらドロップボックスを削除する
      if (num == 10){
        $('#image-box__container').css('display', 'none')
        fileReader.onloadend = function() {
          fileIndex += 1;
          const src = fileReader.result
          imagePreview(src, file.name, fileIndex, inputNum)
        };  
        return false;      
      }
      //読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function() {
        fileIndex += 1;
        const src = fileReader.result
        imagePreview(src, file.name, fileIndex, inputNum)
      };
    });
  });

  // 画像ドラック時の動作
  $(window).on('load', function(e){
    const dropArea = document.getElementById("image-box");

    //ドラッグした要素がドロップターゲットの上にある時にイベントが発火
    dropArea.addEventListener("dragover", function(e){
      e.preventDefault();
      //ドロップエリアに影がつく
      $(this).children('#image-box__container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
    },false);

    //ドラッグした要素がドロップターゲットから離れた時に発火するイベント
    dropArea.addEventListener("dragleave", function(e){
      e.preventDefault();
    //ドロップエリアの影が消える
      $(this).children('#image-box__container').css({'border': 'none','box-shadow': '0px 0px 0px'})      
    },false);

    //ドラッグした要素をドロップした時に発火するイベント
    dropArea.addEventListener("drop", function(e) {

      e.preventDefault();
      $(this).children('#image-box__container').css({'border': 'none','box-shadow': '0px 0px 0px'});

      errorCheckOnAdd();

      const files = e.dataTransfer.files;
      const add_files_length = files.length;

      //ドラッグアンドドロップで取得したデータについて、プレビューを表示
      $.each(files, function(i,file){
        //アップロードされた画像を元に新しくfilereaderオブジェクトを生成
        const fileReader = new FileReader();
        //dataTransferオブジェクトに値を追加
        dataBox.items.add(file)
        file_field.files = dataBox.files
        //lengthでイベントが発火した時点での要素(image)の数に、追加するファイルの数を足す
        const inputNum = $('.shop-image').length + add_files_length
        const num = $('.shop-image').length + i + 1
        //指定されたファイルを読み込む
        fileReader.readAsDataURL(file);
        // 10枚プレビューを出したらドロップボックスが消える
        if (num==10){
          $('#image-box__container').css('display', 'none')
          fileReader.onloadend = function() {
            fileIndex += 1;
            const src = fileReader.result
            imagePreview(src, file.name, fileIndex, inputNum)
          };  
          return false;
        }
        //image fileがロードされた時に発火するイベント
        fileReader.onloadend = function() {
          fileIndex += 1;
          const src = fileReader.result
          imagePreview(src, file.name, fileIndex, inputNum)
        };
      })
    })
  });
  //削除ボタンをクリック時の動作
  $(document).on("click", '.shop-image__operation--delete', function(){
    //削除を押されたプレビュー要素を取得
    const target_image = $(this).parent().parent()
    //削除を押されたプレビューimageのindexを取得
    const targetIndex = $(target_image).data('index')
    //プレビューがひとつだけの場合、file_fieldをクリア
    const images = $('.shop-image');
    console.log(dataBox)
    if (images.length==1) {
      //inputタグに入ったファイルを削除
      $('input[type=file]').val(null)
      dataBox.clearData();
    } else {
      //プレビューが複数の場合
      $.each(images, function(i,input){
        //削除を押されたindexと一致した時、index番号に基づいてdataBoxに格納された要素を削除する
        if($(input).data('index')==targetIndex){
          dataBox.items.remove(i)
        }
      })
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
      file_field.files = dataBox.files
    }
    //プレビューを削除
    target_image.remove()
    //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
    const num = $('.shop-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `shop-num-${num}`)
    
    errorCheckOnDel(num);
  });
});

// ----------------------------------
// ブランドのインクリメンタルサーチ
// ----------------------------------
$(function() {
  const SearchResult = $('#brand-search-result');
  const brandSerchField = $('#brand-search-field')
  const shopBrands = $('#shop-brands')

  function addBrand(brand) {
    const html = `
      <div class="shop-brand">
        <p class="shop-brand__name js-add-btn" data-brand-id="${brand.id}" data-brand-name="${brand.name}">${brand.name}</p>
      </div>
    `
    SearchResult.append(html);
  }

  // 選択したエリア名を、入力フォームに転記
  function addShopBrand(brandName, brandId){
    const html = `
      <div class="shop-brands__selected" data-brand-id="${brandId}" data-brand-name="${brandName}">
        <input name="shop[brand_ids][]" type="hidden", value="${brandId}">
        <p class="shop-brands__selected__name">${brandName}</p>
        <i class="far fa-times-circle shop-brands__selected__btn js-remove-btn"></i>
      </div>
    `
    // <div class="brand-search-remove shop-brand__btn shop-brand__btn--remove js-remove-btn">削除</div>

    shopBrands.append(html);
  }

  brandSerchField.on('keyup', function() {
    const input = brandSerchField.val();
    $.ajax({
      type: 'GET',
      url: '/brands',
      data: { keyword: input },
      dataType: 'json',
    })
    .done(function(brands) {
      SearchResult.empty();
      
      if(brands.length !== 0){
        SearchResult.show();
        brands.forEach(function(brand){
          let brandFlag = true;
          if ($('.shop-brands__selected').length == 0) {
            addBrand(brand);
          } else {
            $('.shop-brands__selected').each(function(e) {
              if ($('.shop-brands__selected').eq(e).data('brand-id') == brand.id) {
                brandFlag = false;
              }
            });
            if (brandFlag) {
              addBrand(brand);
            }  
          }
        });
      } else if (input == "") {
        return false;
      } else {
        SearchResult.hide();
        return false;
      }
    })
    .fail(function() {
      alert("ブランド検索に失敗しました")
    })
  });

  $(document).on('click', '.js-add-btn', function(){
    const brandName = $(this).data('brand-name');
    const branddId = $(this).data('brand-id');
    $(this).parent().remove();
    addShopBrand(brandName, branddId)
  });

  $(document).on('click', '.js-remove-btn', function(){
    $(this).parent().remove();
    const brand = {id: $(this).parent().data('brand-id'), name: $(this).parent().data('brand-name')}
    addBrand(brand)
  });
});
// ----------------------------------
//郵便番号を入力することで住所自動入力
// ----------------------------------
$(function(){
  $("#shop-postal-code").jpostal({
    postcode : [ "#shop-postal-code" ],
    address  : {"#shop-address" : "%3%4%5"}
  });
});