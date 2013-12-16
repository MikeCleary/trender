$(document).ready(function(){

  $('#main').on('click', '.add_story', addStory)

});

function addStory(){
  var story = $(this).data('story')

  $.ajax({
    url: '/reading_lists/' + story + '/add_story/', 
    type: 'POST'
  });
};

