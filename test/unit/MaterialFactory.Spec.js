describe('MaterialFactory', function(){
  beforeEach(module('organizatronApp'));
  var material;

  beforeEach(inject(function(MaterialFactory) {
    material = new MaterialFactory('angular article', 'www.angular.js', 'explaining new routes component', 'angular');
  }));

  it('creates materials', function(){
    expect(material.link).toMatch('www.angular.js');
  });
});
