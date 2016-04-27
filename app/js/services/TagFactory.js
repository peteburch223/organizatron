organizatronApp.factory('TagFactory', function(){
  var tag = function(name){
    this.name = name;
  };
  return tag;
});
