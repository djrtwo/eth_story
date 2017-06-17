pragma solidity ^0.4.11;
import "./library/strings.sol";


contract BlockStory {
    using strings for *;

    struct Submission {
        address user;
        string line;
    }

    uint public numLines;
    uint public lineLength;
    uint public index;
    Submission[] public submissions;

    event WroteLine(address user, uint index, string line);

    function BlockStory(uint _numLines, uint _lineLength) {
        if (_numLines <= 0) throw;
        if (_lineLength <= 0) throw;

        numLines = _numLines;
        lineLength = _lineLength;
        submissions.push(Submission(msg.sender, ""));
        index = 0;
    }

    function writeLine(string line) {
        if (index >= numLines) throw;
        if (msg.sender != submissions[index].user) throw;
        if (line.toSlice().len() > lineLength) throw;

        submissions[index].line = line;
        WroteLine(msg.sender, index, line);
    }

    function finalizeLine(address nextUser) {
        if (index >= numLines) throw;
        if (msg.sender != submissions[index].user) throw;

        index++;
        if (index < numLines) {
            submissions.push(Submission(nextUser, ""));
        }
    }

    function readyStory() {
    }
}