describe('MaterialService', function(){
  beforeEach(module('organizatronApp'));

  var MaterialService, MaterialFactory, httpBackend;


  var materialData = { title: 'angular article', link_url: 'www.angular.js', description: 'explaining new routes component', tags: [ {name: 'angular'}, {name: 'jim'} ] };

  // var tagMaterial = {id:2,name:"Rails","materials":[
  //                       {id:1,link_url:"http://link0.com",title:"Title 0",description:"Description 0"},
  //                       {id:1,link_url:"http://link0.com",title:"Title 0",description:"Description 0"}]},
  //                   {id:3,name:"MEAN","materials":[
  //                       {id:19,link_url:"http://link18.com",title:"Title 18",description:"Description 18"},
  //                       {id:22,link_url:"http://link21.com",title:"Title 21",description:"Description 21"},
  //                       {id:25,link_url:"http://link24.com",title:"Title 24",description:"Description 24"},
  //                       {id:28,link_url:"http://link27.com",title:"Title 27",description:"Description 27"}]}
  var tagMaterial = { title: 'angular article', link_url: 'www.angular.js', description: 'explaining new routes component', tags: [ {name: 'angular'}]};

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
      httpBackend.flush();
  });

  it('should fetch materials associated with tag parameter from api', function(){
    httpBackend.expectGET("http://localhost:3000/materials?tags=angular").respond(tagMaterial);
    var material = new MaterialFactory('angular article', 'wwww.angular.js', 'explaining new routes component', 'angular');
    MaterialService.getByTag('angular').then(function(data){
      expect(data).toEqual(material);
    });
  });
});
