// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

contract Wallet {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    event Deposit (address sender, uint amount, uint balance);
    event Withdraw (uint amount, uint balance);
    event Transfer (address to, uint amount, uint balance);

    function deposit() public payable {
        emit Deposit (msg.sender, msg.value, address(this).balance);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    } 

    function withdraw(uint _amount) public onlyOwner{
        payable(owner).transfer(_amount);
        emit Withdraw (_amount, address(this).balance);
    }

    function transfer(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
        emit Transfer(_to, _amount, address(this).balance);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}