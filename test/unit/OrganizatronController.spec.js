describe('OrganizatronController', function() {
  beforeEach(module('organizatronApp'));
  var ctrl, MaterialService, TagService;
  var deferred, scope;


  var id_0 = 0
  var title_0 = "Title 0"
  var link_0 = "http://link0.com"
  var description_0 = "Description 0"

  var id_1 = 1
  var title_1 = "Title 1"
  var link_1 = "http://link1.com"
  var description_1 = "Description 1"

  var name_0 = "tag_name_0"
  var tag_id_0 = 0
  var votes_0 = 0

  var name_1 = "tag_name_1"
  var tag_id_1 = 1
  var votes_1 = 1

  var tags = [ {name: name_0, id: tag_id_0, votes: votes_0}, {name: name_1, id: tag_id_1, votes: votes_1}]
  var fetchedMaterials = [{id: id_1, title: title_1, link_url: link_1, description: description_1,
     tags: [ {name: name_0, id: tag_id_0, votes: votes_0}, {name: name_1, id: tag_id_1, votes: votes_1}]}]




  beforeEach(inject(function($rootScope, $controller, $q) {
    deferred = $q.defer();

    MaterialService = jasmine.createSpyObj('MaterialService', ['getMaterialByTag']);
    MaterialService.getMaterialByTag.and.returnValue($q.when(fetchedMaterials));

    TagService = jasmine.createSpyObj('TagService', ['getAllTags']);
    TagService.getAllTags.and.returnValue($q.when(tags));

    scope = $rootScope;

    ctrl = $controller('OrganizatronController', {
      MaterialService: MaterialService,
      TagService: TagService
    });
  }));


  it('adds tags that are clicked on to array of tags to be fetched', function(){
    var tagItem = "blah"
    ctrl.selectTag(tagItem)
    expect(ctrl.selectedTags).toContain(tagItem)
  });

  it('fetches materials associated with selected tags', function(){
    var tagItem = "blah"
    ctrl.selectTag(tagItem)

    // console.log("before start")
    ctrl.fetchMaterials(tags)
    console.log("after fetchMaterials")

    scope.$apply();
    expect(ctrl.materials).toEqual(fetchedMaterials)

    // expect MaterialService.getByTag to have been called with tags argument
  });
});
