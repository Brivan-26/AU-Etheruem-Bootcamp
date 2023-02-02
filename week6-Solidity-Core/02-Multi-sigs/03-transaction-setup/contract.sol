// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;

    struct Transaction {
        address destination;
        uint256 value;
        bool executed;
    }

    Transaction[] public transactions;

    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length > 0, "No owners were given");
        require(_required > 0 && _required <= _owners.length, "Require number of signers not valid");
        owners = _owners;
        required = _required;
    }

    function transactionCount() external view returns (uint) {
        return transactions.length;
    }
}
