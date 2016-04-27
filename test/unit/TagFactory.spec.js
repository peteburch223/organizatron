describe('TagFactory', function(){
  beforeEach(module('organizatronApp'));
  var tag;

  beforeEach(inject(function(TagFactory) {
    tag = new TagFactory('angular');
  }));

  it('creates tags', function(){
    expect(tag.name).toMatch('angular');
  });
});
