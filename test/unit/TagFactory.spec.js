describe('TagFactory', function(){
  beforeEach(module('organizatronApp'));
  var tag;

  beforeEach(inject(function(TagFactory) {
    tag = new TagFactory('angular', 1, 0);
  }));

  it('creates tags', function(){
    // console.log(tag.id);
    expect(tag.name).toMatch('angular');
    expect(tag.id).toEqual(1);
    expect(tag.votes).toEqual(0);
  });
});
