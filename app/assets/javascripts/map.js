$(document).ready(function(){
  $(function(){
    $('#main').vectorMap({

      onRegionClick: function(event, code){
        $.ajax({
          url: '/trends/trends_by_region',
          data: {country_code : code}
          // success: ...
        });
      }
    });
  });
});