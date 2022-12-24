// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint8 callTimes = 0;

    function tick() external {
        callTimes++;
        if(callTimes == 10) {
            selfdestruct(payable(msg.sender));
        }
    }
}