organizatronApp.factory('TagFactory', function(){
  var tag = function(name,materialCount){
    this.name = name;
    this.materialCount = materialCount;
  };
  return tag;
});
