$(document).on('turbolinks:load', function(){
  $('.collapsible').collapsible();
  $('.materialboxed').materialbox();
  $('.categories-dropdown-trigger').dropdown({
    coverTrigger: false,
    constrainWidth: false,
  })
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
