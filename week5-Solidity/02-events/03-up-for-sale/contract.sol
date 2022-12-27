// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;
    event Deployed(address _address);
    event Transfer(address _original, address _new);
    event ForSale(uint _price, uint _blockTimestamp);
    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address _receipient) external {
        require(msg.sender == owner, "Only owner can call this function");
        owner = _receipient;
        emit Transfer(msg.sender, _receipient);
    }

    function markPrice(uint _price) external {
        require(msg.sender == owner, "Only owner can call this function!");
        emit ForSale(_price, block.timestamp);
    }
}