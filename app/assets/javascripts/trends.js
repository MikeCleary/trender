$(document).ready(function(){

  $('#side').on('click', '.trend', trendClick);

});

function trendClick(){
  var trend_id = $(this).data('id');
  var trend_subject = $(this).data('subject');
  $.ajax({
    url: '/trends/' + trend_id 
  });
};

