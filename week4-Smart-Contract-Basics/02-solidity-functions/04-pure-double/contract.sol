// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {

    function double(uint _param) external pure returns(uint res) {
        res = _param*2;
    }
}