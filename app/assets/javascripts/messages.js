$(document).ready(function(){
  $('body').on('keypress', '.form-add-comment', function(event){
    var keyCode = (event.keyCode ? event.keyCode : event.which);
    if (keyCode == 13) {
      $(this).closest('form').children('.send-message').trigger('click');
      $("#message_content").val("")
    }
  });
});

