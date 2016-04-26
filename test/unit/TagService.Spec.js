describe('TagService', function(){
  beforeEach(module('organizatronApp'));

  var TagService, TagFactory, httpBackend;


  var tags = [{name: 'angular', materialCount: 10 }, {name: 'rails', materialCount: 6 }];

  beforeEach(inject(function(_TagService_, _TagFactory_, $httpBackend) {
    TagService = _TagService_;
    TagFactory = _TagFactory_;
    httpBackend = $httpBackend;
  }));

  it('gets tags from api', function(){
    httpBackend.expectGET("http://quiet-beach-24792.herokuapp.com/todos.json").respond(tags);
    console.log(TagService.getAllTags());
    TagService.getAllTags().then(function(tag){

      expect(tag).toEqual(tags);
    });
    httpBackend.flush();
  });
});
