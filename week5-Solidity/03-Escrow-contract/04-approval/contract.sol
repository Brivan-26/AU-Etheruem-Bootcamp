// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor;
    address payable public beneficiary;
    address public arbiter;
    bool public isApproved;

    constructor(address _arbiter, address payable _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only the Arbiter can approve"); // already solved the 5th step by adding this x)
        isApproved = true;
        (bool success,) = beneficiary.call{value: address(this).balance}("");
        require(success, "Something wrong happened while transfering funds");
    }
}