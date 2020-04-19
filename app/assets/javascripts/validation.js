$(function() {
  $('form.new_wom').on('submit', function() {
    var array = []
    var error_msg = ""
    var radioval = $('input[name="wom[visit_type]"]:checked').val();
    var rate = $('input[name="wom[rate]"]').last().val();
    var title = $('input[name="wom[title]"]').val();
    var content = $('textarea[name="wom[content]"]').val();
    array.push(radioval)
    array.push(rate)
    array.push(title)
    array.push(content)

    $.each(array, function(index, value) {
      if(value) {
      } else {
        switch(index) {
          case 0:
            error_msg = error_msg + "\n・口コミ対象を選択してください。"
            break;
          case 1:
            error_msg = error_msg + "\n・評価を入力してください。"
            break;
          case 2:
            error_msg = error_msg + "\n・口コミのタイトルを入力してください。"
            break;
          case 3:
            error_msg = error_msg + "\n・口コミ本文を入力してください。"
            break;
        }
      }
    })

    if(error_msg) {
      error_msg = "未入力項目があります。" + error_msg
      alert(error_msg);
      error_msg =""
      return false;
    } 
  });
});