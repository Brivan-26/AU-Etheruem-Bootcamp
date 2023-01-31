// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
	uint cost;
    mapping(address => bool) friends;
    constructor(uint _cost) {
        cost = _cost;
    }

    function rsvp() external payable {
        require(!friends[msg.sender], "You have already RSVP");
        require(msg.value == cost, "Not enough amount to join");
        friends[msg.sender] = true;
    }
}