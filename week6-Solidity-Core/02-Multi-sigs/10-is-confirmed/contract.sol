// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    mapping(address => bool) isOwner;
    uint256 public required;

    struct Transaction {
        address destination;
        uint256 value;
        bool executed;
        bool isConfirmed;
        uint256 confirmations;
    }

    Transaction[] public transactions;
    mapping(uint => mapping(address => bool)) public confirmations;


    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length > 0, "No owners were given");
        require(_required > 0 && _required <= _owners.length, "Require number of signers not valid");
        owners = _owners;
        required = _required;
        for(uint i=0; i< owners.length; i++) {
            isOwner[owners[i]] = true;
        }
    }

    function transactionCount() external view onlyOwner returns(uint) {
        return transactions.length;
    }

    function addTransaction(address _destination, uint _value) onlyOwner internal returns(uint z) {
        z = transactions.length;
        transactions.push(Transaction(_destination, _value, false,false, 0));
    }

    function confirmTransaction(uint _transactionID) public onlyOwner txExists(_transactionID) {
        require(!confirmations[_transactionID][msg.sender], "You already confirmed this thix");
        Transaction storage transaction = transactions[_transactionID];

        confirmations[_transactionID][msg.sender] = true;
        transaction.confirmations++;
    }

    function getConfirmationsCount(uint _tx) external view onlyOwner txExists(_tx) returns (uint){
        return transactions[_tx].confirmations;
    }

    function submitTransaction(address _destination, uint _value) external onlyOwner {
        uint newTx = addTransaction(_destination, _value);
        confirmTransaction(newTx);
    }

    function isConfirmed(uint _tx) public view txExists(_tx) returns(bool) {
        return transactions[_tx].confirmations > 1;
    }


    receive() external payable {}

    modifier txExists(uint id) {
        require(id < transactions.length, "Tx doesn't exist");
        _;
    }
    modifier onlyOwner {
        require(isOwner[msg.sender], "Only owners call call this function");
        _;
    }
}
