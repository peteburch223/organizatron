organizatronApp.controller('OrganizatronController', [function() {
  this.links = [];

  this.addLink = function(link) {
    this.links.push(link);
  };
}]);


// $http({
//   method: 'GET',
//   url: '/someUrl'
// }).then(function successCallback(response) {
//     // this callback will be called asynchronously
//     // when the response is available
//   }, function errorCallback(response) {
//     // called asynchronously if an error occurs
//     // or server returns response with an error status.
//   });
