organizatronApp.service('TagService',['$http', 'TagFactory', function($http, TagFactory){
  var self = this;

  self.getAllTags = function(){
    var tags = [];
    console.log(1);
    _fetchToDosFromApi(tags);
    console.log(2);
    return tags;
  };

  function _fetchToDosFromApi(tags){
    console.log(3);
    return $http.get('http://localhost:3000/')
    .then(function(response){
      console.log(4);
      _handleResponseFromApi(response.data, tags);
    }, function(err){});
  }

  function _handleResponseFromApi (data, tags){
    console.log(5);
      data.forEach(function(data){
        tags.push(new TagFactory(data.name, data.materialCount));
      });
  }
}]);
