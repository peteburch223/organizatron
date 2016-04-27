describe('MaterialService', function(){
  beforeEach(module('organizatronApp'));

  var MaterialService, MaterialFactory, TagFactory, httpBackend;


  var materialData = { title: 'angular article', link_url: 'www.angular.js', description: 'explaining new routes component', tags: [ {name: 'angular'}, {name: 'jim'} ] };

  // var tagMaterial = {id:2,name:"Rails","materials":[
  //                       {id:1,link_url:"http://link0.com",title:"Title 0",description:"Description 0"},
  //                       {id:1,link_url:"http://link0.com",title:"Title 0",description:"Description 0"}]},
  //                   {id:3,name:"MEAN","materials":[
  //                       {id:19,link_url:"http://link18.com",title:"Title 18",description:"Description 18"},
  //                       {id:22,link_url:"http://link21.com",title:"Title 21",description:"Description 21"},
  //                       {id:25,link_url:"http://link24.com",title:"Title 24",description:"Description 24"},
  //                       {id:28,link_url:"http://link27.com",title:"Title 27",description:"Description 27"}]}


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


  var tagMaterial = [{id: id_1, title: title_1, link_url: link_1, description: description_1,
     tags: [ {name: name_0, id: tag_id_0, votes: votes_0}, {name: name_1, id: tag_id_1, votes: votes_1}]}]
                    //  {id: 0, title: 'Title 0', link_url: "http://link0.com", description: "Description 0", tags: [ {name: "Tag 2", id: 2, vote: 1}, {name: "Tag 1", id: 1, vote: 3}]}];

  beforeEach(inject(function(_MaterialService_, _MaterialFactory_, _TagFactory_, $httpBackend) {
    MaterialService = _MaterialService_;
    MaterialFactory = _MaterialFactory_;
    TagFactory = _TagFactory_;
    httpBackend = $httpBackend;
  }));

  it('should post material to api', function(){
    httpBackend
      .whenPOST('http://localhost:3000/materials', materialData).respond({
        title: 'angular article'
      });
    MaterialService.addMaterial(materialData)
    .then(function(response) {
      expect(response.data).toEqual({title: 'angular article'});
    });
    httpBackend.flush();
  });

  it('should fetch materials associated with tag parameter from api', function(){
    httpBackend
    .expectGET("http://localhost:3000/materials?tags=" + name_0)
      .respond(tagMaterial);
      var tags_0 = new TagFactory(name_0, tag_id_0, votes_0)
      var tags_1 = new TagFactory(name_1, tag_id_1, votes_1)
      var material = new MaterialFactory(id_1, title_1, link_1,description_1, [tags_0, tags_1]);
    MaterialService.getMaterialByTag([tags_0]).then(function(data){
      expect(data).toEqual([material]);
    });
    httpBackend.flush();
  });
});
