var BlockStory = artifacts.require("./BlockStory.sol");

// test vars
var numLines = 10;
var lineLength = 50;

module.exports = function(deployer) {
  deployer.deploy(BlockStory, web3.eth.accounts[0], numLines, lineLength);
};
