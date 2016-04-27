organizatronApp.service('TagService',['$http', 'TagFactory', function($http, TagFactory){
  var self = this;

  self.getAllTags = function(){
    var tags = [];
    return $http.get('http://localhost:3000').then(function(response){
      console.log(1);
      response.data.forEach(function(data){
        console.log(data);
        tags.push(new TagFactory(data.name, data.materialCount));
      });
      return tags;
    }, function(err){
      console.log(err);
    });
  };

  
}]);
