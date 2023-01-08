pragma solidity ^0.5.1;

contract Modifiers {
    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    address owner;

    uint256 openingTime = 1673188763 ;

    // custom modifier
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // Working with time
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        string _firstName;
        string _lastName;
    }

    constructor() public {
        owner = msg.sender;
    }

    // function addPerson(string memory _firstName, string memory _lastName)
    //     public
    //     onlyOwner
    // {
    //     incCount();
    //     people[peopleCount] = Person(_firstName, _lastName);
    // }

    function addPerson(string memory _firstName, string memory _lastName)
        public
        onlyWhileOpen
    {
        incCount();
        people[peopleCount] = Person(_firstName, _lastName);
    }

    // internal keyword makes variable and functions hidden outside the contract but visible inside same contract
    function incCount() internal {
        peopleCount += 1;
    }


}
