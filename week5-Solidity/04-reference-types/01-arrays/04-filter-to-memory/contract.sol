// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function filterEven( uint[] memory _nums) external pure returns (uint[] memory) {
        uint elements;
        for (uint i = 0; i < _nums.length; i++) {
            if (_nums[i] % 2 == 0) {
                elements++;
            }
        }

        uint[] memory res = new uint[](elements);
        uint filledIndex = 0;
        for (uint i = 0; i < _nums.length; i++) {
            if (_nums[i] % 2 == 0) {
                res[filledIndex] = _nums[i];
                filledIndex++;
            }
        }
        return res;
    }
}