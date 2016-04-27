organizatronApp.controller('OrganizatronController', ['MaterialFactory', 'MaterialService','TagFactory','TagService',function(MaterialFactory, MaterialService, TagFactory,TagService) {
  var vm = this;

  vm.materials = [];
  vm.tags = TagService.getAllTags();
  console.log(vm.tags);
  vm.addMaterial = function(materials) {
    vm.materials.push(materials);
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
