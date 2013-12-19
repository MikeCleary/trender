
function prefix(){
  var env = $('meta[name=rails_env]').attr('content');
  if(env === 'production'){
    return '/trendr/'
  }else{
    return '/'
  };
};