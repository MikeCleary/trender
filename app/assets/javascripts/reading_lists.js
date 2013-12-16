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
    type: 'POST'
  });
};

function stopFollow(list){
  $.ajax({
    url: '/reading_lists/' + list + '/remove_follow',
    type: 'DELETE'
  });
};
