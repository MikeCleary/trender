$(document).ready(function(){

  $('#main').on('click', '.add_story', addStory)

});

function addStory(){
  var story = $(this).data('story')

  $.ajax({
    url: prefix + '/reading_lists/add_story/' + story, 
    type: 'POST'
  });
};

