document.addEventListener('turbolinks:load', function(){
  link = document.location.href
  parseLink(link)
});

parseLink = function(link) {
  if (link.split('').includes('#')) {
    post_id = link.split('#')[1];
    moveLink(post_id)
  }
}

moveLink = function(post_id){
  element = document.getElementById(post_id)
  console.log(element)
  $('html,body').animate({
    scrollTop: $(element).position().top -= 200
});
}
