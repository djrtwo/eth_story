pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BlockStory.sol";

contract TestBlockStory {
  function testValidInitialization() {
    BlockStory story = BlockStory(DeployedAddresses.BlockStory());

    uint expected = 0;

    Assert.equal(story.index(), 0, "Index should be initialized to 0");
    Assert.isAbove(story.lineLength(), 0, "lineLength is required to be greater than 0");
    Assert.isAbove(story.numLines(), 0, "numLines is required to be greater than 0");
    //Assert.equal(story.submissions().length, 1, "There should be 1 submission.");
  }
}
