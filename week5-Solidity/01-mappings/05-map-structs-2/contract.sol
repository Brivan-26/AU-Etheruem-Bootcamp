// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		require(!users[msg.sender].isActive, "You can not call this function!");
		users[msg.sender] = User(100, true);
	}

	function transfer(address _address, uint _amount) external {
		require(users[msg.sender].isActive && users[_address].isActive, "The sender or the recipents are not active members!");
		require(users[msg.sender].balance >= _amount, "Not enough balance");
		users[msg.sender].balance -= _amount;
		users[_address].balance += _amount;
	}

}