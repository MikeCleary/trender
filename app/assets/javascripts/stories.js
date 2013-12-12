$(document).ready(function(){

$('#main').on('click', '.add_story', addStory)

});

function addStory(){
  var story = $(this).data('story')
  var reading_list = $(this).data('readinglist')

  $.ajax({
    url: '/reading_lists/add_story/', 
    data: {
      story_id : story, 
      reading_list_id : reading_list
    }
  });
};