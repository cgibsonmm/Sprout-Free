$(document).on('turbolinks:load', function(){
  form = $('#forum_post_body')
  console.log($(form))

  form.on('touchstart click', function(){
    console.log('runnnig')
    bottomBar = $('#mobile-bottom-nav');

    if (bottomBar) {
      $('#mobile-bottom-nav').hide();
    }
  })
})
