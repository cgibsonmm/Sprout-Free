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
    duration: 300,
  });

  setInterval(function() {
      $('.carousel').carousel('next');
    }, 6000);
})
