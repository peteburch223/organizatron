organizatronApp.controller('OrganizatronController', ['MaterialFactory', 'MaterialService','TagFactory','TagService',function(MaterialFactory, MaterialService, TagFactory,TagService) {
  var vm = this;

  vm.materials = [];
  vm.tags = [];
  vm.selectedTags = [];

  TagService.getAllTags()
    .then(function(data){
      vm.tags = data;
    });

  vm.selectTag = function(tag) {
    console.log(tag.name)
    console.log(vm.selectedTags)
    if(vm.selectedTags.indexOf(tag) == -1){
      vm.selectedTags.push(tag);
    }
  };

  vm.fetchMaterials = function() {
    console.log("in fetchMaterials")
    MaterialService.getMaterialByTag(vm.selectedTags)
    .then(function(data){
      vm.materials = data;
    })
  };

  vm.addMaterial = function(materials){
    console.log(materials)
    MaterialService.addMaterial(materials);
  }


}]);


// $http({
//   method: 'GET',
//   url: '/someUrl'
// }).then(function successCallback(response) {
//     // this callback will be called asynchronously
//     // when the response is available
//   }, function errorCallback(response) {
//     // called asynchronously if an error occurs
//     // or server returns response with an error status.
//   });
