// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $(function(){
    $('#main').vectorMap({

      onRegionClick: function(event, code){
        console.log("bingo!")
        $.ajax({
          url: '/trends/trends_by_region',
          data: {country_code : code}
          // success: ...
        });
      }
    });
  });

});