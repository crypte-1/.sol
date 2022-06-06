// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender); // making msg.sender address payable
    }

    receive() external payable {}

    // receive or fallback secial function are  to receive ether sent to current smart contract

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

// Anyone can send ETH.
// Only the owner can withdraw.
