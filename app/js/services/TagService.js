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
    // console.log(tags);
    // return tags;
  };

  // self.getAllTags = function(){
  //   var tags = [];
  //   return $http.get('http://localhost:3000').then(function(response){
  //     console.log(response);
  //   }, function(err){
  //     console.log(err);
  //   });
  // };
  // function _fetchToDosFromApi(tags){
  //   return $http.get('http://localhost:3000/')
  //   .then(function(response){
  //     console.log(4);
  //     _handleResponseFromApi(response.data, tags);
  //   }, function(err){});
  // }
  //
  // function _handleResponseFromApi (data, tags){
  //   console.log(5);
  //     data.forEach(function(data){
  //       tags.push(new TagFactory(data.name, data.materialCount));
  //     });
  // }
}]);
