// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Switch {
    address payable recipient;
    address owner;
    uint lastPing;
    constructor(address _recipient) payable {
        owner = msg.sender;
        recipient = payable(_recipient);
        lastPing = block.timestamp;
    }
    function withdraw() external {
        if(block.timestamp - lastPing < 52 weeks) {
            revert("This function can not be called now");
        }
        (bool success,) = recipient.call{value: address(this).balance}("");
        require(success, "Something went wrong");
    }

    function ping() external{
        require(msg.sender == owner, "Only owner can call this function");
        lastPing = block.timestamp;
    }
}