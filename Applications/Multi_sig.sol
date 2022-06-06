// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MultiSigWallet {
    event Deposit(address indexed sender, uint amount, uint balance);
    // event to trigger as ether deposited
    event SubmitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data
    );
    // to show as transaction submited
    event ConfirmTransaction(address indexed owner, uint indexed txIndex);
    // conforming transactions by owers
    event RevokeConfirmation(address indexed owner, uint indexed txIndex);
    // owners can revoke their aprovance
    event ExecuteTransaction(address indexed owner, uint indexed txIndex);
    // Execute the contract after attaining suffecient approvals
}
