// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint public x;
    constructor(uint _x) { // default visibility for functions is public
        x = _x;
    }
}