// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote[] public votes;

	function createVote(Choices choice) external {
		votes.push(Vote(choice, msg.sender));
	}

	function hasVoted(address _voter) external view returns (bool) {
		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == _voter) {
				return true;
			}
		}
		return false;
	}
	
	function findChoice(address _voter) external view returns(Choices choice) {
		for (uint i=0; i<votes.length;i++) {
			if(votes[i].voter == _voter) {
				choice = votes[i].choice;
			}
		}
	}


}