describe('OrganizatronController', function() {
  beforeEach(module('organizatronApp'));
  var ctrl;

  beforeEach(inject(function($controller) {
    ctrl = $controller('OrganizatronController');
  }));

  it('allows a user to add links', function() {
    ctrl.addLink('new Link');
    expect(ctrl.links).toContain('new Link');
  });


});
