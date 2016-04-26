organizatronApp.service('MaterialService', ['$http', 'MaterialFactory', function($http, MaterialFactory) {
  var self = this;

  self.getAll = function() {
    // Code here
  };

  self.addMaterial = function(material) {
    return $http.post('http://localhost:3000', material)
    .success(function(data) {
      return data;
    });
  };
}]);
