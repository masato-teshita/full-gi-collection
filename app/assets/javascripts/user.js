$(function() {
  $('.user-icon').on('click', function(){
    $('#user-img').click();
  });  
});

// $('#user-img').on('change', function(){
//   return function(event){
//     var file = $(this).prop('files')[0];
//     var formData = new FormData();
//     formData.append('file', file);

//     $.ajax('/upload' {
//       type: 'POST’,
//       contentType: false,
//       processData: false,
//       data: formData,
//       error: function() {
//         //アップロードエラー時の処理
//       },
//       success: function(res) {
//         //アップロード成功時の処理
//       }
//     });
//     return false;
//   }
// });