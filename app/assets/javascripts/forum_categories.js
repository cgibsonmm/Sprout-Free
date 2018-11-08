$(document).on("turbolinks:load", function(){
  $('#forum_categories').sortable({
    update: function(e, ui){
      Rails.ajax({
        url: $(this).data('url'),
        type: "PATCH",
        data: $(this).sortable('serialize')
      })
    }
  });
});
