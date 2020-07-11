//////////////////// エリアフィールド ////////////////////
$(function() {
  var SearchResultHd = $('#search-result-hd');
  var areaSearchFieldHd = $('#area-search-field-hd');
  var keywordFieldHd = $('#keyword-field-hd')
  var candidateList = $('.candidate-list');

  var form_width = areaSearchFieldHd.outerWidth() *2;

  $(window).resize(function() {
    var areaSearchFieldHd = $('#area-search-field-hd');
    var form_width = areaSearchFieldHd.outerWidth() *2;
    SearchResultHd.width(form_width);
  });

  function addArea(area) {
    var html = `
      <div class='candidate type-area' data-area-id="${area.id}" data-area-name="${area.name}">
        <span>${area.name}</span>
      </div>
    `
    SearchResultHd.show();
    SearchResultHd.width(form_width);
    candidateList.append(html);
  }

  function addErrMsgHTML(msg) {
    var html = `
      <div class='no-result'>
        <span>${msg}</span>
      </div>
    `
    SearchResultHd.show();
    SearchResultHd.width(form_width);
    candidateList.append(html);
  }

  // 選択したエリア名を、入力フォームに転記
  function addAreaInput(areaName, areaId){
    
    areaSearchFieldHd.val([areaName]);
    SearchResultHd.hide();
    keywordFieldHd.focus();
  }

  areaSearchFieldHd.on('keyup', function() {
    var input = areaSearchFieldHd.val();
    console.log('OK')

    $.ajax({
      type: 'GET',
      url: '/areas',
      data: { area: input },
      dataType: 'json',
    })
    .done(function(areas) {
      candidateList.empty();
      
      if(areas.length !== 0){
        areas.forEach(function(area){
          addArea(area);
        });
      } else if(input == "") {
        SearchResultHd.hide();
        return false;
      } else {
        addErrMsgHTML("エリアが見つかりません");
      }
    })
    .fail(function() {
      alert("エリア検索に失敗しました")
    })
  });

  $(document).on('click', '.type-area', function(){
    const areaName = $(this).data('area-name');
    const areaId = $(this).data('area-id');
    addAreaInput(areaName, areaId)
  });

})
//--------------------------------------------------------
//////////////////// キーワードフィールド ////////////////////
//--------------------------------------------------------
$(function() {
  var SearchResultHd = $('#search-result-hd');
  var keywordFieldHd = $('#keyword-field-hd')
  var candidateList = $('.candidate-list');
  var submitBtn = $('#search-submit-btn-hd')
  const rateField = $('#rate-field-hd');


  var form_title_width = $('.app-icon').width();
  var box_left_top = form_title_width;
  var form_width = keywordFieldHd.outerWidth() *2;

  function addKeyword(keyword) {
    var html = `
      <div class='candidate type-keyword' data-keyword-id="${keyword.id}" data-keyword-name="${keyword.name}">
        <span>${keyword.name}</span>
      </div>
    `
    SearchResultHd.show();
    SearchResultHd.css({ 'margin-left': box_left_top});
    SearchResultHd.width(form_width);
    candidateList.append(html);
  }

  // 選択したエリア名を、入力フォームに転記
  function addInput(keywordName, keywordId){
    keywordFieldHd.val([keywordName]);
    SearchResultHd.hide();
    rateField.focus();
  }

  keywordFieldHd.on('keyup', function() {
    var input = keywordFieldHd.val();

    $.ajax({
      type: 'GET',
      url: '/genres',
      data: { keyword: input },
      dataType: 'json',
    })
    .done(function(keywords) {
      candidateList.empty();
      
      if(keywords.length !== 0){
        keywords.forEach(function(keyword){
          addKeyword(keyword);
        });
      } else {
        SearchResultHd.hide();
        return false;
      }
    })
    .fail(function() {
      alert("キーワード検索に失敗しました")
    })
  });

  $(document).on('click', '.type-keyword', function(){
    const keywordName = $(this).data('keyword-name');
    const keywordId = $(this).data('keyword-id');
    addInput(keywordName, keywordId)
  });

})