// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
	uint cost;
    mapping(address => bool) didRSVP;
     address[] friends;
    constructor(uint _cost) {
        cost = _cost;
    }

    function rsvp() external payable {
        require(!didRSVP[msg.sender], "You have already RSVP");
        require(msg.value == cost, "Not enough amount to join");
        didRSVP[msg.sender] = true;
        friends.push(msg.sender);
    }

    function payBill(address _venue, uint _amount) external {
        (bool success, ) = payable(_venue).call{value: _amount}("");
        require(success, "Something went wrong with billing");
        uint leftAmount = address(this).balance / friends.length;
        for(uint i=0; i< friends.length; i++) {
            payable(friends[i]).call{value: leftAmount}("");
        }

    }
}