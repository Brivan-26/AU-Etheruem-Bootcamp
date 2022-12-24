pragma solidity ^0.8.4;

contract Contract {
    
    function sumAndAverage(uint _num1, uint _num2, uint _num3, uint _num4) external pure returns (uint sum, uint average) {
        sum = _num1 + _num2 + _num3 + _num4;
        average = (_num1 + _num2 + _num3 + _num4)/4;
    }
}