describe('Basic feature test of organizatron App', function() {
  var mock = require('protractor-http-mock');


  var id_0 = 0;
  var title_0 = "Title 0";
  var link_0 = "http://link0.com";
  var description_0 = "Description 0";

  var id_1 = 1;
  var title_1 = "Title 1";
  var link_1 = "http://link1.com";
  var description_1 = "Description 1";

  var name_0 = "angular";
  var tag_id_0 = 0;
  var votes_0 = 0;

  var name_1 = "rails";
  var tag_id_1 = 1;
  var votes_1 = 1;




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

    mock([{
      request: {
        path: 'http://localhost:3000/materials?tags=angular',
      method: 'GET'
    },
      response: {
        data: [{id: id_1, title: title_1, link_url: link_1, description: description_1,
           tags: [ {name: name_0, id: tag_id_0, votes: votes_0}, {name: name_1, id: tag_id_1, votes: votes_1}]}]
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
    console.log(tags.first());
    var firstTag = tags.first();
    firstTag.click();
    $('#select-tags').click();
    var materials = $$('.materials p');
    expect(materials.first().getText()).toMatch('angular text book');
  });
});
