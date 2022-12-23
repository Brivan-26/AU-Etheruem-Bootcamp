// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {

    function double(uint _param) external pure returns(uint res) {
        res = _param*2;
    }

    function double(uint _param1, uint _param2) external pure returns(uint, uint) {
        return (_param1*2, _param2*2);
    }
}