organizatronApp.service('MaterialService', ['$http', 'MaterialFactory', 'TagFactory', function($http, MaterialFactory, TagFactory) {
  var self = this;

  self.getAll = function() {
    // Code here
  };

  self.addMaterial = function(material) {
    return $http.post('http://localhost:3000/materials', material)
    .success(function(data) {
      return data;
    });
  };

  self.getMaterialByTag = function(tag) {
    return $http.get('http://localhost:3000/materials?tags=' + tag)
      .then(function(response){
        return response.data.map(createMaterial)
      })
  }

  function createMaterial(material){
    var tags = material.tags.map(createTag)
    return new MaterialFactory(material.id, material.title, material.link_url, material.description, tags);
  };

  function createTag(tag){
    return new TagFactory(tag.name, tag.id, tag.votes);
  }
}]);
