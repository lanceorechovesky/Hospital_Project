$(document).ready(function() {

  console.log($('body'))
  
  $(".search_hospital_patients").click( function() {
    var link = $(this).attr("link")
    console.log($('.hospital_patient_search').val())
    $.ajax({
      url: link,
      dataType: "script",
      type: "GET",
      data: {q: $('.hospital_patient_search').val()}
    })
  })

  $(".new_page").click(function() {
    var new_page = $(this).html()
    console.log(new_page)
    $(".patient_list").addClass("hidden")
    $(".group_" + new_page).removeClass("hidden")
  })

  $( "#accordion" ).accordion();

  // $(".workflow_change").on( 'change', function() {
  //   var link = $(this).attr("link")
  //   $.ajax({
  //     url: link,
  //     dataType: "script",
  //     type: "GET",
  //   })
  // })





})