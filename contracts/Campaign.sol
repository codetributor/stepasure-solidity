// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Campaign {
    address[] public runners;
    uint public amount;
    uint public miles;
    uint public startDate;
    uint public endDate;
    bool public ended;

    constructor(uint _amount, uint _miles, uint _startDate, uint _endDate) {
        runners.push(msg.sender);
        amount = _amount;
        miles = _miles;
        startDate = _startDate;
        endDate = _endDate;
    }

    function addRunner() public payable {
        require(msg.value >= amount, "You did not send enough funds");
        runners.push(msg.sender);
    }

    //getter functions

    function getTotalRunners() public view returns(uint){
        return runners.length;
    }

    function getTotalFunds() public view returns(uint) {
        return address(this).balance;
    }

    function checkUpkeep() public view returns(bool){
        if(block.timestamp >= endDate) {
            return true;
        } else {
            return false;
        }
    }

    function performUpkeep() public {}
}
