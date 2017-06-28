pragma solidity ^0.4.11;
import "./library/strings.sol";


contract BlockStory {
    using strings for *;

    uint public numLines;
    uint public lineLength;
    uint public index;
    address[] public users;
    string[] public lines;

    event WroteLine(address user, uint index, string line);

    function BlockStory(address initialUser, uint _numLines, uint _lineLength) {
        if (_numLines <= 0) throw;
        if (_lineLength <= 0) throw;

        numLines = _numLines;
        lineLength = _lineLength;
        users.push(initialUser);
        lines.push("");
        index = 0;
    }

    function writeLine(string line) {
        if (index >= numLines) throw;
        if (msg.sender != users[index]) throw;
        if (line.toSlice().len() > lineLength) throw;
        if (line.toSlice().len() > lineLength) throw;

        lines[index] = line;
        WroteLine(msg.sender, index, line);
    }

    function finalizeLine(address nextUser) {
        if (index >= numLines) throw;
        if (msg.sender != users[index]) throw;

        index++;
        if (index < numLines) {
            users.push(nextUser);
            lines.push("");
        }
    }

    function readyStory() {
    }
}