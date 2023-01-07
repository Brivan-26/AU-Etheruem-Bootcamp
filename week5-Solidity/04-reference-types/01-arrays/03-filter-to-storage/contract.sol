// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] memory _nums) external {
        for(uint i=0; i<_nums.length; i++) {
            if(_nums[i]%2 ==0) {
                evenNumbers.push(_nums[i]);
            }
        }
    }
} 