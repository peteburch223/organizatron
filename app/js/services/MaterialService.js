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

  self.getByTag = function(tag) {
    console.log("in getByTag")
    return $http.get('http://localhost:3000/materials?tags=' + tag)
      .then(function(response){
        console.log("in success")
        console.log(response.data);

        return response.data.map(createMaterial)
      })
  }

  function createMaterial(material){
    console.log("in createMaterial")
    console.log(material);
    return new MaterialFactory(material.title, material.link_url, material.description, material.tags);
  };


}]);
