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

  vm.getTagsForList = function() {
    TagService.getAllTags()
      .then(function(data){
        vm.tags = data;
        vm.updateTags();
      });
  };

  vm.getTagsForList();

  vm.selectTag = function(tag) {
    if(vm.selectedTags.indexOf(tag) == -1) {
      vm.selectedTags.push(tag);
      vm.updateTags();
      vm.fetchMaterials();
    }
  };

  vm.removeTag = function(tag) {
    vm.selectedTags.splice(vm.selectedTags.indexOf(tag), 1);
    vm.updateTags();
    vm.fetchMaterials();
  };

  vm.fetchMaterials = function() {
    if(vm.selectedTags.length === 0) {
      vm.materials = [];
    }
    else {
      MaterialService.getMaterialByTag(vm.selectedTags)
      .then(function(data){
        vm.materials = data;
      });
    }
  };

  vm.addMaterial = function(materials){
    MaterialService.addMaterial(materials);
    vm.getTagsForList();
  };

  vm.sendVote = function(vote, materialTag){
    console.log(vote);
    VoteService.sendVote(vote);
    materialTag.votes += vote.vote.value;
  };
}]);
