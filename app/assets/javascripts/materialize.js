$(document).on('turbolinks:load', function(){
  $('.dropdown-trigger').dropdown({coverTrigger: false,});
  $('.dropdown-right-trigger').dropdown({
    coverTrigger: false,
    alignment: 'right'
  })
})
