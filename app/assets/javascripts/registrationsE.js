$(document).ready(function() {

  console.log($('body'))

  var clean_email = $('input#user_email').val();
  var valdate = $('')

  $('input#user_email').addClass("valid")
  $('#user_password_confirmation').addClass("valid")

  $('input#user_email').on( 'keyup', function() {
    var user_email = $( this ).val();
    var is_email = clean_email === user_email;
    if(is_email){
      $(this).removeClass("invalid").addClass("valid")
      $('input.submit').removeAttr("disabled")
    }
    else{
      $(this).removeClass("valid").addClass("invalid")
      $('input.submit').Attr("disabled")
    }
  })

  $('input#user_password').on( 'keyup', function() {
    var passw = $( this ).val();
    var pass_confirm = $( '#user_password_confirmation' ).val();
    var inputs_right = passw == pass_confirm;
    if(inputs_right){
      $('#user_password_confirmation').removeClass("invalid").addClass("valid")
      $('input.submit').removeAttr("disabled")
    }
    else{
      $('#user_password_confirmation').removeClass("valid").addClass("invalid")
      $('input.submit').Attr("disabled")
    }
  })

  $('input#user_password_confirmation').on( 'keyup', function() {
    var passw = $( '#user_password' ).val();
    var pass_confirm = $( this ).val();
    var inputs_right = passw == pass_confirm;
    if(inputs_right){
      $('#user_password_confirmation').removeClass("invalid").addClass("valid")
      $('input.submit').removeAttr("disabled")
    }
    else{
      $('#user_password_confirmation').removeClass("valid").addClass("invalid")
      $('input.submit').Attr("disabled")
    }
  })
    
})
