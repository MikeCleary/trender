$(document).ready(function(){

$('#main').on('click', '.add_story', addStory)

});

function addStory(){
  story_id = $(this).data('id')
  $.ajax({
    url: '/reading_list/update/' + $(this).data('id')
  });
};