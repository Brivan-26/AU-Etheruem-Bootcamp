// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor;
    address payable public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address payable _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }
}