pragma solidity ^0.5.1;

import "./8_token.sol";

contract TokenTimeLock {
    Token public token;
    address public benificiary;
    uint256 public releaseTime;

    constructor(
        Token _token,
        address _benificiary,
        uint256 _releaseTime
    ) public {
        require(_releaseTime >= block.timestamp);
        token = _token;
        benificiary = _benificiary;
        releaseTime = _releaseTime;
    }

    function release() public {
        require(block.timestamp >= releaseTime);

        uint256 amount = token.balanceOf(address(this));
        require(amount > 0);
        token.transfer(benificiary,amount);
        

    }

}
