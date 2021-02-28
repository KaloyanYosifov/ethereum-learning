// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "./Token.sol";

contract Bank {
    Token private token;

    mapping(address => uint256) public depositedEthereum;

    event Deposited(address indexed sender, uint256 amount);
    event Withdrawed(address indexed sender, uint256 amount);

    constructor(Token _token) {
        token = _token;
    }

    function deposit() public payable {
        depositedEthereum[msg.sender] = msg.value + depositedEthereum[msg.sender];

        emit Deposited(msg.sender, msg.value);
    }

    function withdraw() public {
        uint256 etherToSend = depositedEthereum[msg.sender];

        msg.sender.transfer(etherToSend);

        depositedEthereum[msg.sender] = 0;

        // send 10 tokens to the user who withdraw
        token.mint(msg.sender, 10);

        emit Withdrawed(msg.sender, etherToSend);
    }
}