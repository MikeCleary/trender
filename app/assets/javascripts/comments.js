$(document).ready(function(){
  $('#comments').on('click', '.show-reply-form', showReplyForm);
  $('.comment-form').on('click', '.post', hideForm);
});

function showReplyForm(){
  var comment = '.reply-form-for-' + $(this).data('comment');
  $(comment).removeClass('hidden');
};

function hideForm(){
 var form = this.parentElement.parentElement.parentElement;
 $(form).addClass('hidden');
}