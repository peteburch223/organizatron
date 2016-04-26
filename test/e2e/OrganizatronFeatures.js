describe('Basic feature test of organizatron App', function() {
  it('has a title', function() {
    browser.get('/');
    expect(browser.getTitle()).toEqual('organizatron App');
  });

  it('allows links to be added', function() {
    browser.get('/');
    $('#add-material-name').clear().sendKeys('user added material');
    $('#add-material-url').clear().sendKeys('http://url.com/');
    $('#save-material').click();
    var linkName = $$('.materials').first();
    var linkUrl = linkName.$('a');
    expect(linkName.getText()).toContain('user added material');
    expect(linkUrl.getAttribute('href')).toEqual('http://url.com/');
  });
});
