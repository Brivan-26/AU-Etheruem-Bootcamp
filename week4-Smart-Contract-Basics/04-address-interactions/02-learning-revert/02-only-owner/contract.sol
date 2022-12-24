// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address owner;
    constructor() payable {
        require(msg.value >= 1e18, "1 Ether at least must be deposited");
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can call this function");
        (bool success,) = owner.call{value: address(this).balance}("");
        require(success, "Something wrong happened");
    }

}