organizatronApp.service('MaterialService', ['$http', 'MaterialFactory', function($http, MaterialFactory) {
  var self = this;
  // var title;

  self.getAll = function() {
    // Code here
  };

  self.addMaterial = function(material) {
    self.title = 'test2';
    return $http.post('http://localhost:3000', material)
    .success(function(data) {
      console.log(data);
      return data;
      // console.log(title)
    });
  };
}]);
