$(document).on('turbolinks:load', function(){
  $('#user_terms_of_service').click(function() {
  	if ($('#submitbtn').is(':disabled')) {
      	$('#submitbtn').removeAttr('disabled');
      } else {
      	$('#submitbtn').attr('disabled', 'disabled');
      }
  });
});

$(document).on('page:load', function(){
  $('#user_terms_of_service').click(function() {
  	if ($('#submitbtn').is(':disabled')) {
      	$('#submitbtn').removeAttr('disabled');
      } else {
      	$('#submitbtn').attr('disabled', 'disabled');
      }
  });
})
