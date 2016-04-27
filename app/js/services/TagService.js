organizatronApp.service('TagService',['$http', 'TagFactory', function($http, TagFactory){
  var self = this;

  self.getAllTags = function(){
    var tags = [];
    // _fetchApidata(tags);
    return $http.get('http://localhost:3000').then(function(response){
      response.data.forEach(function(data){
        tags.push(new TagFactory(data.name));
      });
      return tags;
    }, function(err){
      console.log(err);
    });

    // function _fetchApidata(tags){
    //   return $http.get('http://localhost:3000').then(function(response){
    //     _handleApiResponse(response.data, tags);
    //   }, function(err){});
    // }
    //
    // function _handleApiResponse(data,tags){
    //   data.forEach(function(data){
    //     tags.push(new TagFactory(data.name, data.materialCount));
    //     return tags;
    //   });
    // }
  };


}]);
