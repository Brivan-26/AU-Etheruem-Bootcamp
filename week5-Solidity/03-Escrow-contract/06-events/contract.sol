// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor;
    address payable public beneficiary;
    address public arbiter;
    bool public isApproved;
    event Approved(uint _amount);

    constructor(address _arbiter, address payable _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only the Arbiter can approve");
        isApproved = true;
        uint amount = address(this).balance;
        (bool success,) = beneficiary.call{value: address(this).balance}("");
        require(success, "Something wrong happened while transfering funds");
        emit Approved(amount);
    }
}