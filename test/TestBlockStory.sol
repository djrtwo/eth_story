pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BlockStory.sol";

contract TestBlockStory {
    uint numLines;
    uint lineLength;

    function beforeEach() {
        numLines = 10;
        lineLength = 50;
    }
 
    function testValidDeployedContract() {
        BlockStory story = BlockStory(DeployedAddresses.BlockStory());

        Assert.equal(story.index(), 0, "Index should be initialized to 0");
        Assert.isAbove(story.lineLength(), 0, "lineLength should be greater than 0");
        Assert.isAbove(story.numLines(), 0, "numLines should be greater than 0");
        //Assert.equal(story.submissions().length, 1, "There should be 1 submission.");
    }

    function testValidInitialization() {
        BlockStory story = new BlockStory(numLines, lineLength);

        Assert.equal(story.index(), 0, "Index should be initialized to 0");
        Assert.equal(story.lineLength(), lineLength, "lineLength should be initialized to val");
        Assert.equal(story.numLines(), numLines, "numLines should be initialized to val");
        //Assert.equal(story.submissions().length, 1, "There should be 1 submission.");
    }
}
