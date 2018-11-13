$(document).on("turbolinks:load", function(){
  if(gon.admin == true){
    console.log('admin can drag')
    $('#forum_categories').sortable({
      update: function(e, ui){
        Rails.ajax({
          url: $(this).data('url'),
          type: "PATCH",
          data: $(this).sortable('serialize')
        })
      }
    });

    $('#forum_topics').sortable({
      update: function(e, ui){
        Rails.ajax({
          url: $(this).data('url'),
          type: "PATCH",
          data: $(this).sortable('serialize')
        })
      }
    })
  };
});
