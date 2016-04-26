describe('Basic feature test of organizatron App', function() {
  it('has a title', function() {
    browser.get('/');
    expect(browser.getTitle()).toEqual('organizatron App');
  });

  it('allows links to be added', function() {
    browser.get('/');
    $('#add-material-title').clear().sendKeys('user added material');
    $('#add-material-url').clear().sendKeys('http://url.com/');
    $('#add-material-description').clear().sendKeys('short piece about node');
    $('#add-material-tag').clear().sendKeys('node');

    $('#save-material').click();
    var linkName = $$('.materials').first();
    var linkUrl = linkName.$('a');
    expect(linkName.getText()).toMatch('user added material');
    expect(linkName.getText()).toMatch('short piece about node');
    expect(linkName.getText()).toMatch('tag: node');
    expect(linkUrl.getAttribute('href')).toEqual('http://url.com/');
  });
});
