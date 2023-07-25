// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FunctionsAndErrors {
    address public owner;
    uint256 public balance=50;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount should be greater than 0");

        balance += msg.value;
    }

    function withdraw(uint256 amount) public {
        assert(amount <= balance);

        require(msg.sender == owner, "Only the contract owner can withdraw");
        require(amount > 0, "Withdrawal amount should be greater than 0");

        balance -= amount;

        revert("Withdrawal successful, but custom error message");
    }

    function checkBalance() public view returns (uint256) {
        require(msg.sender == owner, "Only the contract owner can check the balance");
        return balance;
    }
}
