describe('MaterialService', function(){
  beforeEach(module('organizatronApp'));

  var TagService, MaterialFactory, httpBackend;


  var tags = {{name: 'angular', materialCount: 10 }, {name: 'rails', materialCount: 6 }};

  beforeEach(inject(function(_TagService_, _MaterialFactory_, $httpBackend) {
    TagService = _TagService_;
    MaterialFactory = _MaterialFactory_;
    httpBackend = $httpBackend;
    httpBackend
      .whenGET('http://localhost:3000').respond({ tags });
  }));

  it('gets tags from api', function(){
      MaterialService.getAllTags()
        .then(function(response) {
          expect(response.data).toEqual({tags);
        });
      httpBackend.flush();
  });
});
