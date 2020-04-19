//////////////////// エリアフィールド ////////////////////
$(function() {
  var SearchResult = $('#search-result');
  var areaSearchField = $('#area-search-field');
  var keywordField = $('#keyword-field')
  var candidateList = $('.candidate-list');

  var form_title_width = $('.form-explanation').width();
  var box_left_top = form_title_width + 64;
  var form_width = areaSearchField.outerWidth() *2;

  $(window).resize(function() {
    var form_title_width = $('.form-explanation').width();
    var box_left_top = form_title_width + 64;
    var areaSearchField = $('#area-search-field');
    var form_width = areaSearchField.outerWidth() *2;
  
    SearchResult.css({ 'margin-left': box_left_top});
    SearchResult.width(form_width);
  });

  function addArea(area) {
    var html = `
      <div class='candidate type-area' data-area-id="${area.id}" data-area-name="${area.name}">
        <span>${area.name}</span>
      </div>
    `
    SearchResult.show();
    SearchResult.css({ 'margin-left': box_left_top});
    SearchResult.width(form_width);
    candidateList.append(html);
  }

  function addErrMsgHTML(msg) {
    var html = `
      <div class='no-result'>
        <span>${msg}</span>
      </div>
    `
    SearchResult.show();
    SearchResult.css({ 'margin-left': box_left_top});
    SearchResult.width(form_width);
    candidateList.append(html);
  }

  // 選択したエリア名を、入力フォームに転記
  function addAreaInput(areaName, areaId){
    
    areaSearchField.val([areaName]);
    SearchResult.hide();
    keywordField.focus();
  }

  areaSearchField.on('keyup', function() {
    var input = areaSearchField.val();
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
        SearchResult.hide();
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
  var SearchResult = $('#search-result');
  var keywordField = $('#keyword-field')
  var candidateList = $('.candidate-list');
  var submitBtn = $('#search-submit-btn')

  var form_title_width = $('.form-explanation').width();
  var box_left_top = form_title_width + 64;
  var form_width = keywordField.outerWidth() *2;

  function addKeyword(keyword) {
    var html = `
      <div class='candidate type-keyword' data-keyword-id="${keyword.id}" data-keyword-name="${keyword.name}">
        <span>${keyword.name}</span>
      </div>
    `
    SearchResult.show();
    SearchResult.css({ 'margin-left': box_left_top});
    SearchResult.width(form_width);
    candidateList.append(html);
  }

  // 選択したエリア名を、入力フォームに転記
  function addInput(keywordName, keywordId){
    keywordField.val([keywordName]);
    SearchResult.hide();
    submitBtn.focus();
  }

  keywordField.on('keyup', function() {
    var input = keywordField.val();

    $.ajax({
      type: 'GET',
      url: '/brands',
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
        SearchResult.hide();
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