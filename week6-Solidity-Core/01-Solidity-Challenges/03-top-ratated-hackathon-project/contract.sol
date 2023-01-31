// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }
    
    Project[] projects;

    // TODO: add the findWinner function

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

    function rate(uint _idx, uint _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }

    function findWinner() external view returns(Project memory){
        uint highestAverageRating = 0;
        uint index = 0;
        for (uint i=0; i< projects.length; i++) {
            Project memory project = projects[i];
            uint _ratings = 0;
            for (uint j=0; j<project.ratings.length; j++) {
                _ratings += project.ratings[j];
            }
            if(_ratings / project.ratings.length > highestAverageRating) {
                highestAverageRating = _ratings / project.ratings.length;
                index = i;
            }
        } 

        return projects[index];
    }
}
