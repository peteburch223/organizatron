describe('TagService', function(){
  beforeEach(module('organizatronApp'));

  var TagService, TagFactory, httpBackend;

  var tags = [{name: 'angular', materialCount: 10 }, {name: 'rails', materialCount: 6 }];

  beforeEach(inject(function(_TagService_, _TagFactory_, $httpBackend) {
    TagService = _TagService_;
    TagFactory = _TagFactory_;
    httpBackend = $httpBackend;
    httpBackend.expectGET("http://localhost:3000/tags").respond(tags);
  }));


  it('gets tags from api', function(){
    TagService.getAllTags().then(function(tag){
      var tag1 = new TagFactory('angular' );
      var tag2 = new TagFactory('rails');
      expect(tag).toEqual([tag1, tag2]);
    });
    httpBackend.flush();
  });
});
