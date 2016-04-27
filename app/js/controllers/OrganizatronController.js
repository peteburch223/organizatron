organizatronApp.controller('OrganizatronController', ['MaterialFactory', 'MaterialService','TagFactory','TagService',function(MaterialFactory, MaterialService, TagFactory,TagService) {
  var vm = this;

  vm.materials = [];
  vm.tags = [];
  vm.selectedTags = [];


  TagService.getAllTags()
    .then(function(data){
      // console.log(data);
      vm.tags = data;
    });
  // console.log(vm.tags);


  vm.selectTag = function(tag) {
    vm.selectedTags.push(tag);
  };

  vm.fetchMaterials = function() {
    console.log("in fetchMaterials")

    console.log(vm.selectedTags)
    MaterialService.getMaterialByTag(vm.selectedTags)
    .then(function(data){
      console.log(data)
      vm.materials = data;
    })
  };
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
