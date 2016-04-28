organizatronApp.controller('OrganizatronController', ['MaterialFactory', 'MaterialService','TagFactory','TagService', 'VoteService', function(MaterialFactory, MaterialService, TagFactory,TagService, VoteService) {
  var vm = this;

  vm.materials = [];
  vm.tags = [];
  vm.selectedTags = [];
  vm.tagsForSelection = [];

  Array.prototype.diff = function(a) {
    return this.filter(function(i) {return a.indexOf(i) < 0;});
  };

  vm.updateTags = function() {
    vm.tagsForSelection = (vm.tags).diff(vm.selectedTags);
  };

  TagService.getAllTags()
    .then(function(data){
      vm.tags = data;
      vm.updateTags();
    });

  vm.selectTag = function(tag) {
    if(vm.selectedTags.indexOf(tag) == -1) {
      vm.selectedTags.push(tag);
      vm.updateTags();
    }
  };

  vm.removeTag = function(tag) {
    vm.selectedTags.splice(vm.selectedTags.indexOf(tag), 1);
    vm.updateTags();
  };

  vm.fetchMaterials = function() {
    console.log("in fetchMaterials");
    MaterialService.getMaterialByTag(vm.selectedTags)
    .then(function(data){
      vm.materials = data;
    });
  };

  vm.addMaterial = function(materials){
    console.log(materials);
    MaterialService.addMaterial(materials);
  };

  vm.sendVote = function(vote, materialTag){
    console.log(vote);
    VoteService.sendVote(vote);
    materialTag.votes += vote.vote.value;

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
