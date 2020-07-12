// 並び替えの挙動
$(function() {
  // プルダウンメニューを選択することでイベントが発生
  $('select[name=sort_order]').change(function() {
    // 選択したoptionタグのvalue属性を取得する
    const sort_order = $(this).val();
    // value属性の値により、ページ遷移先の分岐

    switch (sort_order) {
      case 'woms-desc': html = "&sort=woms_count_desc"; break;
      case 'rate-desc': html = "&sort=rate_desc"; break;
      case 'rate-asc': html = "&sort=rate_asc"; break;
      case 'created_at-desc': html = "&sort=created_at+desc"; break;
      case 'created_at-asc': html = "&sort=created_at+asc"; break;
      default: html = "&sort=created_at+desc"; 
    }
    // 現在の表示ページ
    let current_html = window.location.href;
    if (location['href'].match(/search=*.+/) == null) {
      html = "/search?q%5Barea_name_cont%5D=" + html
    }
    // ソート機能の重複防止 
    if (location['href'].match(/&sort=*.+/) != null) {
      var remove = location['href'].match(/&sort=*.+/)[0]
      current_html = current_html.replace(remove, '')
    };
    // ページ遷移
    window.location.href = current_html + html
  });
  // ページ遷移後の挙動
  $(function () {
    if (location['href'].match(/&sort=*.+/) != null) {
      // option[selected: 'selected']を削除
      if ($('select option[selected=selected]')) {
        $('select option:first').prop('selected', false);
      }

      const selected_option = location['href'].match(/&sort=*.+/)[0].replace('&sort=', '');

      switch (selected_option) {
        case "woms_count_desc": var sort = 1; break;
        case "rate_desc": var sort = 2; break;
        case "rate_asc": var sort = 3; break;
        case "created_at+desc": var sort = 4; break;
        case "created_at+asc": var sort = 5; break;
        default: var sort = 0
      }
      const add_selected = $('select[name=sort_order]').children()[sort]
      $(add_selected).attr('selected', true)
    }
  });
});