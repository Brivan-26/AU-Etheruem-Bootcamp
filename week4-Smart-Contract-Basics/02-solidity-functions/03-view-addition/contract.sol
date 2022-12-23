// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint public x;
    constructor(uint _x) { // default visibility is public for functions
        x = _x;
    }

    function increment() external {
        x++;
    }

    function add(uint _x) external returns(uint) {
        return x+=_x;
    }
}