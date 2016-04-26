describe('OrganizatronController', function() {
  beforeEach(module('organizatronApp'));
  var ctrl;

  beforeEach(inject(function($controller) {
    ctrl = $controller('OrganizatronController');
  }));

  it('allows a user to add links', function() {
    var linkItem = { title:'new Link', url:'#' };
    ctrl.addMaterial(linkItem);
    expect(ctrl.materials).toContain(linkItem);
  });
});
