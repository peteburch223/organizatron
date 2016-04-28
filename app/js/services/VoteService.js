organizatronApp.service('VoteService', ['$http', function($http){
  var self = this;

  self.sendVote = function(vote) {
    console.log(vote);
    return $http.post('http://localhost:3000/votes', vote)
    .success(function(data) {
      return data;
    });
  };
}]);
