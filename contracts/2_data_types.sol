pragma solidity ^0.5.1;

contract DataTypes{
    // public keyword exposes the variables outside the contract and make it accessible 
    // constant keywork makes variable mutable
    string public constant stringValue = "MY_TEXT"; 

    bool public myBool = true;

    int public myInt = 1;

    // unsigned int
    uint public myUint = 1;

    // uint8 = 8 bytes (0-255)
    uint8 public myUint8 = 255;


    enum State { Waiting, Ready, Active }
    State public state;


    struct Person{
        string _firstName;
        string _lastName;
    }
    uint256 peopleCount;
    // Person[] public people;
    // The above statement can also be return as
    mapping(uint => Person) public people;
    function addPerson(string memory _firstName,string memory _lastName) public {
        // people.push(Person( _firstName, _lastName ));
        peopleCount += 1;
        people[peopleCount] = Person(_firstName, _lastName);
        
    }

    constructor() public {
        state = State.Waiting;
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns(bool) {
        return state == State.Active;
    }

}