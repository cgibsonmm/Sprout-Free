$(document).on('turbolinks:load', function(){
  $('.materialboxed').materialbox();
  $('.dropdown-trigger').dropdown({coverTrigger: false,});
  $('.dropdown-right-trigger').dropdown({
    coverTrigger: false,
    alignment: 'right'
  })
  $('.carousel').carousel({
    fullWidth: true,
    duration: 1000,
  });

  setInterval(function() {
      $('.carousel').carousel('next');
    }, 5000);
})
