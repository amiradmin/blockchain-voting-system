// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    // Struct to represent a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    uint public totalVotes; // This will keep track of total votes

    uint public candidatesCount;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        totalVotes = 0;
        candidatesCount = 0;
    }

    // Add candidate function (can only be called by owner)
    function addCandidate(string memory _name) public onlyOwner {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // Function to vote for a candidate
    function vote(uint _candidateId) public {
        // Ensure the sender hasn't voted yet
        require(!voters[msg.sender], "You have already voted");

        // Ensure the candidate is valid
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate");

        // Mark the sender as a voter
        voters[msg.sender] = true;

        // Update the candidate's vote count
        candidates[_candidateId].voteCount++;

        // Increment the total number of votes
        totalVotes++;
    }

    // Function to get total votes
    function getTotalVotes() public view returns (uint) {
        return totalVotes;
    }

    // Function to get candidate details
    function getCandidate(uint _candidateId) public view returns (string memory name, uint voteCount) {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate");
        Candidate memory candidate = candidates[_candidateId];
        return (candidate.name, candidate.voteCount);
    }

    // Function to get total candidates
    function totalCandidates() public view returns (uint) {
        return candidatesCount;
    }
}
