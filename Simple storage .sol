// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {

    uint256 private storedNumber;
    address public owner;
    uint256 public updateCount;

    event NumberUpdated(uint256 newNumber, address updatedBy);

    constructor(uint256 _initialNumber) {
        storedNumber = _initialNumber;
        owner = msg.sender;
        updateCount = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function setNumber(uint256 _newNumber) public onlyOwner {
        storedNumber = _newNumber;
        updateCount++;
        emit NumberUpdated(_newNumber, msg.sender);
    }

    function getNumber() public view returns (uint256) {
        return storedNumber;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }
}
