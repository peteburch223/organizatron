describe('VoteService', function() {
  beforeEach(module('organizatronApp'));

  var VoteService, httpBackend;

  beforeEach(inject(function(_VoteService_, $httpBackend) {
    VoteService = _VoteService_;
    httpBackend = $httpBackend;
    httpBackend.expectPOST("http://localhost:3000/votes").respond(true);
  }));

  it('sends vote', function(){
    // material id, tag id and vote
    VoteService.sendVote(3,1,1)
      .then(function(response) {
        expect(response.data).toEqual(true);
      });
      httpBackend.flush();
  });
});
