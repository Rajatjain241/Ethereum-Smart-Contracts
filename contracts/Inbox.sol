// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

contract Inbox{
    string public message;

    constructor (string memory initialMessage) {
        message = initialMessage;
    }
    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
    function getMessage() public view returns(string memory) {
        return message;
    }
}