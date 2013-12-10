// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $(function(){
    $('#trend_map').vectorMap({

      onRegionClick: function(event, code){
        $.ajax({
          dataType: "json",
          url: 'http://localhost:3000',
          data: {country_code : code}
          // success: ...
        });
      }
    });
  });

});