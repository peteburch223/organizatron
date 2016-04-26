describe('MaterialService', function(){
  beforeEach(module('organizatronApp'));

  var MaterialService, MaterialFactory, httpBackend;


  var materialData = { title: 'angular article', link_url: 'www.angular.js', description: 'explaining new routes component', tags: [ {name: 'angular'}, {name: 'jim'} ] };

  beforeEach(inject(function(_MaterialService_, _MaterialFactory_, $httpBackend) {
    MaterialService = _MaterialService_;
    MaterialFactory = _MaterialFactory_;
    httpBackend = $httpBackend;
    httpBackend
      .whenPOST('http://localhost:3000', materialData).respond({
        title: 'angular article'
      });
  }));

  it('should post material to api', function(){
      MaterialService.addMaterial(materialData)
        .then(function(response) {
          expect(response.data).toEqual({title: 'angular article'});
        });

      // expect(MaterialService.title).toEqual({title: 'angular article'});
      httpBackend.flush();
  });
});
