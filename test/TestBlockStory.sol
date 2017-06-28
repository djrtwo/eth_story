pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BlockStory.sol";

contract TestBlockStory {
    uint numLines;
    uint lineLength;
    address nextUser;

    event LogAddr(address addr);

    function beforeEach() {
        numLines = 10;
        lineLength = 50;
        nextUser = "0x829BD824B016326A401d083B33D092293333A830";
    }
 
    function testValidDeployedContract() {
        BlockStory story = BlockStory(DeployedAddresses.BlockStory());

        Assert.equal(story.index(), 0, "Index should be initialized to 0");
        Assert.isAbove(story.lineLength(), 0, "lineLength should be greater than 0");
        Assert.isAbove(story.numLines(), 0, "numLines should be greater than 0");
    }

    function testNewBlockStory() {
        BlockStory story = new BlockStory(msg.sender, numLines, lineLength);

        Assert.equal(story.index(), 0, "Index should be initialized to 0");
        Assert.equal(story.lineLength(), lineLength, "lineLength should be initialized to val");
        Assert.equal(story.numLines(), numLines, "numLines should be initialized to val");
        Assert.equal(story.users(0), msg.sender, "The first user should be the creater.");
    }

    function testFinalizeLine() {
        //BlockStory story = new BlockStory(msg.sender, numLines, lineLength);

        //Assert.equal(story.users(0), msg.sender, "The first user should be the creater.");
        //story.finalizeLine(nextUser);
        //Assert.equal(story.users(1), nextUser, "The next user should be added to users.");
    }
}
