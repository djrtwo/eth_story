var BlockStory = artifacts.require("BlockStory");

contract('BlockStory', function(accounts) {
  it("should log WroteLine event when writeLine", function(done) {
    var line = "test line";
    //var blockStory = BlockStory.deployed();

    BlockStory.deployed().then(function(blockStory) {
      var events = blockStory.allEvents();
      blockStory.writeLine(line).then(new Promise(
        function(resolve, reject){
          events.watch(function(error, log){ resolve(log, done); });
      }).then(function(log, done){
        assert.equal(log.event, "WroteLine", "Event must be a WroteLine");
      }).then(done).catch(done));
    });
  });
});

