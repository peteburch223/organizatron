organizatronApp.service('VoteService', ['$http', function($http){
  var self = this;

  self.sendVote = function(MaterialId, TagId, vote) {
    return $http.post('http://localhost:3000/votes', MaterialId, TagId, vote)
    .success(function(data) {
      return data;
    });
  };
}]);
