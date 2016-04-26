describe('TagFactory', function(){
  beforeEach(module('organizatronApp'));
  var tag;

  beforeEach(inject(function(TagFactory) {
    tag = new TagFactory('angular', 13);
  }));

  it('creates tags', function(){
    expect(tag.name).toMatch('angular');
    expect(tag.materialCount).toBe(13);
  });
});
