describe('Basic feature test of organizatron App', function() {
  it('has a title', function() {
    browser.get('/');
    expect(browser.getTitle()).toEqual('organizatron App');
  });

  it('allows links to be added', function() {
    $('#add-link').clear().sendKeys('new Link');
    $('#save-link').click();
    var linkItem = $$('.links').first().getText();
    expect(linkItem).toContain('new Link');
  });
});
