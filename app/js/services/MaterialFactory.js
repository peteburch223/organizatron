organizatronApp.factory('MaterialFactory', function(){
  var material = function(title, link, description, tags) {
    this.title = title;
    this.link = link;
    this.description = description;
    this.tags = [tags];
  };
  return material;
});
