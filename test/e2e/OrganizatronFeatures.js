describe('Basic feature test of organizatron App', function() {
  it('has a title', function() {
    browser.get('/');
    expect(browser.getTitle()).toEqual('organizatron App');
  });
});
