$(document).ready(function(){
  $(function(){
    $('#main').vectorMap({

      regionStyle: {
        initial: {
          fill: 'black',
          "fill-opacity": 1,
          stroke: 'none',
          "stroke-width": 0,
          "stroke-opacity": 1
        }
      },

      series: {
        regions: [{
          values: countries,
          scale: ['#4099FF'],
          normalizeFunction: 'polynomial'
        }]
      },

      backgroundColor: '#FFFFFF',

      onRegionClick: function(event, code){
        $('#side').html("<img src='assets/loader.gif' class='loader'>");
        console.log("jam");
        $.ajax({
          url: '/trends/trends_by_region',
          data: {country_code : code}
        });
      }
    });
  });
});