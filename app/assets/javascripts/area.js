$(function() {
  var areaSearchResult = $('#area-search-result');
  var areaSearchField = $('#area-search-field');
  var keywordField = $('#keyword-field')
  var candidateAreaList = $('.candidate-area-list');

  var form_title_width = $('.form-explanation').width();
  var box_left_top = form_title_width + 64;
  var form_width = areaSearchField.outerWidth() *2;

  function addArea(area) {
    var html = `
      <div class='candidate-area' data-area-id="${area.id}" data-area-name="${area.name}">
        <span>${area.name}</span>
      </div>
    `
    areaSearchResult.show();
    areaSearchResult.css({ 'margin-left': box_left_top});
    areaSearchResult.width(form_width);
    candidateAreaList.append(html);
  }

  function addErrMsgHTML(msg) {
    var html = `
      <div class='no-result'>
        <span>${msg}</span>
      </div>
    `
    areaSearchResult.show();
    areaSearchResult.css({ 'margin-left': box_left_top});
    areaSearchResult.width(form_width);
    candidateAreaList.append(html);
  }

  // 選択したエリア名を、入力フォームに転記
  function addInput(areaName, areaId){
    
    areaSearchField.val([areaName]);
    areaSearchResult.hide();
    keywordField.focus();
  }

  $('#area-search-field').on('keyup', function() {
    var input = $('#area-search-field').val();

    $.ajax({
      type: 'GET',
      url: '/areas',
      data: { area: input },
      dataType: 'json',
    })
    .done(function(areas) {
      candidateAreaList.empty();
      
      if(areas.length !== 0){
        areas.forEach(function(area){
          addArea(area);
        });
      } else if(input == "") {
        areaSearchResult.hide();
        return false;
      } else {
        addErrMsgHTML("エリアが見つかりません");
      }
    })
    .fail(function() {
      console.log('NG')
      // alert("エリア検索に失敗しました")
    })
  });

  $(document).on('click', '.candidate-area', function(){
    const areaName = $(this).data('area-name');
    const areaId = $(this).data('area-id');
    addInput(areaName, areaId)
  });

})