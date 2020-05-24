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
  /* ------------------------------
  Loading イメージ表示関数
  引数： msg 画面に表示する文言
  ------------------------------ */
  function dispLoading(msg){
    // 引数なし（メッセージなし）を許容
    if( msg == undefined ){
      msg = "";
    }
    // 画面表示メッセージ
    const dispMsg = "<div class='loadingMsg'>" + msg + "</div>";
    // ローディング画像が表示されていない場合のみ出力
    if($("#loading").length == 0){
      $("body").append("<div id='loading'>" + dispMsg + "</div>");
    }
  }
  
  /* ------------------------------
  Loading イメージ削除関数
  ------------------------------ */
  function removeLoading(){
    $("#loading").remove();
  }

  function imageChange() {
    dispLoading("処理中...");
    const user_id = $('.user-image-path').val();
    const formData = new FormData(document.getElementById(`edit_user_${user_id}`));
    const url = `/users/${user_id}`
    const user_url = location.href;

    if (url != '') {
      $.ajax({
        url: url,
        type: "PATCH",
        data: formData,
        dataType: 'html',
        processData: false,
        contentType: false
      })
      .done(function() {
        window.location = user_url
      })
      .fail(function() {
        alert('miss!')
      })
      .always(function() {
        removeLoading();
      });
    }
  }


  $('.delete-img-btn').on('click', function(e) {
    e.preventDefault();
    const res = confirm("アイコンを削除しますか？")
    if (res) {
      dispLoading("処理中...");
      const user_id = $('.user-image-path').val();
      const url = `/users/${user_id}`
      const formData = new FormData(document.getElementById(`edit_user_${user_id}`));
      formData.append('delete_img', "削除")
      const user_url = location.href;
      if (url != '') {
        $.ajax({
          url: url,
          type: "PATCH",
          data: formData,
          dataType: 'html',
          processData: false,
          contentType: false
        })
        .done(function() {
          window.location = user_url
        })
        .fail(function() {
          alert('miss!')
        })
        .always(function() {
          removeLoading();
        });
      }  
    }
  });

  $('#user-img').on('change', function(e) {
    if (e.target.files[0]) {
      e.preventDefault();
      imageChange();
    }
  })
})

//ユーザーログイン・作成画面でのアラートの「×」ボタンを押した時の処理
$(function() {
  $('.error-close-btn').on('click', function() {
    $(this).parents('.devise-alert').remove();
  })
})