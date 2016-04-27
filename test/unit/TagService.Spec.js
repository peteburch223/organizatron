describe('TagService', function(){
  beforeEach(module('organizatronApp'));

  var TagService, TagFactory, httpBackend;

  var tags = [{name: 'angular', materialCount: 10 }, {name: 'rails', materialCount: 6 }];

  beforeEach(inject(function(_TagService_, _TagFactory_, $httpBackend) {
    TagService = _TagService_;
    TagFactory = _TagFactory_;
    httpBackend = $httpBackend;
    httpBackend.expectGET("http://localhost:3000").respond(tags);
  }));


  it('gets tags from api', function(){
    TagService.getAllTags().then(function(tag){
      expect(tag).toEqual('angular');
    });
    // expect(TagService.getAllTags()).toEqual(tags);
    httpBackend.flush();
  });
});
