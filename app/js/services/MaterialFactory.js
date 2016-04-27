organizatronApp.factory('MaterialFactory', function(){
  var material = function(id, title, link, description, tags) {
    this.title = title;
    this.link = link;
    this.description = description;
    // console.log(tags);
    this.tags = tags;
  };
  return material;
});
