$(document).ready(function(){

  $('#side').on('click', '.trend', trendClick);

});

function trendClick(){
  $('#main').html("<img src='assets/loader.gif' class='loader'>");
  var trend_id = $(this).data('id');
  var trend_subject = $(this).data('subject');
  $.ajax({
    url: '/trends/' + trend_id 
  });
};

