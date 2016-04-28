organizatronApp.factory('TagFactory', function(){
  var tag = function(name, id, votes){
    this.name = name;
    this.id = id;
    this.votes = 0;
  };
  return tag;
});
