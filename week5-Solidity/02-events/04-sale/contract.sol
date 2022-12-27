// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;
    bool isForSale = false;
    uint price = 0;

    event Deployed(address _address);
    event Transfer(address _original, address _new);
    event ForSale(uint _price, uint _blockTimestamp);
    event Purchase(uint _amount, address _buyer);

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
        isForSale = true;
        price = _price;
        emit ForSale(_price, block.timestamp);
    }

    function purchase() payable external {
        require(isForSale, "The collectible is not for sale now!");
        require(msg.value >= price, "Not sufficient amount");
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Something went wrong when sending money to the owner");
        isForSale = false;
        owner = msg.sender;
        emit Purchase(msg.value, msg.sender);
    }
}