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