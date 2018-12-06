runSort = function(){
  $('#forum_categories').sortable({
    update: function(e, ui){
      Rails.ajax({
        url: $(this).data('url'),
        type: "PATCH",
        data: $(this).sortable('serialize')
      });
    }
  });

  $('#forum_topics').sortable({
    update: function(e, ui){
      Rails.ajax({
        url: $(this).data('url'),
        type: "PATCH",
        data: $(this).sortable('serialize')
      });
    }
  });
}


$(document).on('turbolinks:load', function(){
  sortBtn = $('#sort-btn')
  sortBtn.on('click', runSort)
});
