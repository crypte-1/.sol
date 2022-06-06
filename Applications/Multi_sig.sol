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

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public numConfirmationsRequired;
    // min num of approvals

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        uint numConfirmations;
    }
    // mapping from tx index => owner => bool
    mapping(uint => mapping(address => bool)) public isConfirmed;

    Transaction[] public transactions;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }
    // whether mes.sender is in owners list
    modifier txExists(uint _txIndex) {
        require(_txIndex < transactions.length, "tx does not exist");
        _;
    }

    modifier notExecuted(uint _txIndex) {
        require(!transactions[_txIndex].executed, "tx already executed");
        _;
    }

    modifier notConfirmed(uint _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], "tx already confirmed");
        _;
    }
}
