$(document).ready(function() {

  console.log($('body'))
  
  $(".search_patient_medications").click( function() {
    var link = $(this).attr("link")
    console.log($('.patient_medication_search').val())
    $.ajax({
      url: link,
      dataType: "script",
      type: "GET",
      data: {q: $('.patient_medication_search').val()}
    })
  })

  $(".new_page").click(function() {
    var new_page = $(this).html()
    console.log(new_page)
    $(".medication_list").addClass("hidden")
    $(".group_" + new_page).removeClass("hidden")
  })

  $( "#accordion" ).accordion();

})