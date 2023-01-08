pragma solidity ^0.4.24;

contract MyContract{
    string value;

    // Constructor
    constructor() public {
        value = "MY_TEXT";
    }

    function get() public view returns(string) {
        // view keyword is used when we don't need to modifiy anything in smart contract 
        return value;
    }

    function set(string _value) public {
        value = _value;
    }

}