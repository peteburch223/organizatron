organizatronApp.service('TagService',['$http', 'TagFactory', function($http, TagFactory){
  var self = this;

  self.getAllTags = function(){
    var tags = [];
    // _fetchApidata(tags);
    return $http.get('http://localhost:3000/tags').then(function(response){
      response.data.forEach(function(data){
        tags.push(new TagFactory(data.name));
      });
      return tags;
    }, function(err){
      // console.log('error' + err);
    });
  };


}]);
