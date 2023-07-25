# Functions-and-Errors---ETH-AVAX-Smart-Contract-
A smart contract that implements the require(), assert() and revert() statements.

### Smart Contract Error Handling

This repository contains a Solidity smart contract that demonstrates the usage of `assert`, `revert`, and `require` statements for error handling. The contract includes functions for depositing and withdrawing funds, as well as checking the contract's balance.

## Demonstation Video : https://www.loom.com/share/70c3f51f1a2649d58c007c6e5a4ba4f6?sid=2f83796c-6ac6-4bb8-8d02-a0b05bd1d158
## Code:
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

## Usage

To interact with the smart contract, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the [Remix website](https://remix.ethereum.org/).

2. Create a new file and save it with a .sol extension (e.g., `FunctionsAndErrors.sol`).

3. Copy and paste the provided Solidity code into the file.

4. Click on the "Solidity Compiler" tab and set the compiler version to 0.8.18 (or another compatible version). Click on "Compile FunctionsAndErrors.sol" to compile the code.

5. Deploy the contract by clicking on the "Deploy & Run Transactions" tab. Select the "FunctionsAndErrors" contract from the dropdown menu and click "Deploy."

6. Once the contract is deployed, you can interact with it using the provided functions:
   - Use the `deposit` function to deposit funds into the contract.
   - Use the `withdraw` function to withdraw a specified amount from the contract.
   - Use the `checkBalance` function to view the contract's current balance.

## Error Handling

The contract uses `require` statements for regular error handling, such as checking for valid conditions before proceeding with transactions. If a `require` statement evaluates to `false`, the transaction is reverted, and any gas consumed until that point is refunded to the caller.

The `assert` statement is used for internal checks that should never be false under any circumstances. If an `assert` statement evaluates to `false`, it indicates a critical error, and the transaction will be reverted, consuming all remaining gas and discarding all state changes made up to that point.

The `revert` statement is used for regular error handling and allows you to provide custom error messages. When executed, it reverts the transaction with a custom error message.

Please use this contract as a reference to understand error handling in Solidity and how to use these statements effectively in your smart contracts. Feel free to explore and modify the code to suit your needs.

## Author : 
 Anurag Mishra
 
## License

This project is licensed under the MIT License.
