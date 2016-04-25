describe('Basic feature test of organizatron App', function() {
  it('has a title', function() {
    browser.get('/');
    expect(browser.getTitle()).toEqual('organizatron App');
  });

  it('allows links to be added', function() {
    $('#add-link-name').clear().sendKeys('user added link');
    $('#add-link-url').clear().sendKeys('http://url.com/');
    $('#save-link').click();
    var linkName = $$('.links').first();
    var linkUrl = linkName.$('a')
    expect(linkName.getText()).toContain('user added link');
    expect(linkUrl.getAttribute('href')).toEqual('http://url.com/');
  });
});
