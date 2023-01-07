// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    address[] members;

    constructor() public {
        members.push(msg.sender);
    }
    function addMember(address _member) external {
        require(isMember(msg.sender), "Only member can call this function");
        members.push(_member);
    }

    function removeLastMember() external {
        require(isMember(msg.sender), "Only member can call this function");
        members.pop();
    }

    function isMember(address _member) public view returns(bool) {
        for (uint i=0; i<members.length; i++) {
            if (members[i] == _member) {
                return true;
            }
        }
        return false;
    }

} 