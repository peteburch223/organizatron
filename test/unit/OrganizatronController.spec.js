describe('OrganizatronController', function() {
  beforeEach(module('organizatronApp'));
  it('initialises with a toDo', function() {
    expect(ctrl.organizatron).toEqual("Organizatron1");
  });
  var ctrl;
  beforeEach(inject(function($controller) {
    ctrl = $controller('OrganizatronController');
  }));
});
