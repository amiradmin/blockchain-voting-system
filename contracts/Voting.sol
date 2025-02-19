// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(address => bool) public voters;  // Track voters to ensure each can vote only once
    mapping(string => uint256) public votes;  // Track votes for each candidate

    // Event to log the vote
    event Voted(address indexed voter, string candidate);

    // Function to vote for a candidate
    function vote(string memory candidate) public {
        require(!voters[msg.sender], "You have already voted.");
        voters[msg.sender] = true;
        votes[candidate]++;
        emit Voted(msg.sender, candidate);
    }

    // Function to get the number of votes for a candidate
    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }
}
