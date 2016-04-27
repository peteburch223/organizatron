describe('Basic feature test of organizatron App', function() {
  var mock = require('protractor-http-mock');

  beforeEach(function(){
    mock([{
      request: {
        path: 'http://localhost:3000/tags',
      method: 'GET'
    },
      response: {
        data: [{id: 1, name: 'angular'}, {id: 2, name: 'rails'}]
      }
    }]);
  });

  it('has a title', function() {
    browser.get('/');
    expect(browser.getTitle()).toEqual('organizatron App');
  });

  xit('allows links to be added', function() {
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

  it('fetches materials by tag', function(){
    var tags = $$('.tags p');
    var firstTag = tags.first();
    firstTag.click();
    var materials = $$('.materials p');
    expect(materials.first().getText()).toMatch('angular text book');
  });
});
