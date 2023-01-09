pragma solidity ^0.5.1;
import "./6_math_lib.sol";

contract MathLib{
    
    uint256 public value;

    function calculate(uint _value1, uint _value2) public {
        value = Math.divide(_value1,_value2);
    }

}