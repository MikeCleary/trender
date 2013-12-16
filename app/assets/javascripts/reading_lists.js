// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.follow').click( toggleFollow );
});

function toggleFollow(){
  var list = $(this).data('list')
  var state = event.target.textContent
  if(state === "Follow"){
    startFollow(list);
    $(event.target).text("Following");
  }else{
    stopFollow(list);
    $(event.target).text("Follow");
  };
};

function startFollow(list){
  $.ajax({
    url: '/reading_lists/' + list + '/add_follow' ,
    // data: {
    //   reading_list_id: list
    // },
    type: 'POST'
  });
};

function stopFollow(list){
  $.ajax({
    url: '/reading_lists/' + list + '/remove_follow',
    // data: {
    //   reading_list_id: list
    // },
    type: 'DELETE'
  });
};
