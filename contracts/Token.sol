//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.3;

import "hardhat/console.sol";

contract Token {
    string public name = "Rogi Token";
    string public symbol = "RGT";
    uint public totalSupply = 1000000;
    mapping(address => uint) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens"); //se não passar não continua
        balances[msg.sender] -= amount; //subtrai a qtdade enviada do sender
        balances[to] += amount; //adiciona a qtdade enviada ao address to
    }

    function balanceOf(address account) external view returns (uint) {
        return balances[account];
    }
}