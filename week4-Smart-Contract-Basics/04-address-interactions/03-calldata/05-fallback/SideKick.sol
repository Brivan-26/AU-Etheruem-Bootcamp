// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Sidekick {
    function makeContact(address hero) external {
        (bool success,) = hero.call("0x74787777");
    }
}