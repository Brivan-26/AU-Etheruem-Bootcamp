// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function sum(uint[5] memory _nums) pure external returns(uint){
        uint res;
        for (uint i=0; i< _nums.length; i++) {
            res += _nums[i];
        }
        return res;
    }

}