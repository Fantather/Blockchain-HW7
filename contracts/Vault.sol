// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IVault.sol";

contract Vault is IVault {
    address public owner;
    address public broker;
    mapping(address => uint256) public override balanceOf;

    event BrokerSet(address indexed broker);
    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    modifier onlyBroker() {
        require(msg.sender == broker, "only broker");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setBroker(address brokerAddress) public {
        require(msg.sender == owner, "only owner");
        require(broker == address(0), "broker already set");
        require(brokerAddress != address(0), "zero address");
        broker = brokerAddress;
        emit BrokerSet(brokerAddress);
    }

    function deposit(address user) public payable override onlyBroker {
        require(msg.value > 0, "amount must be more than zero");
        balanceOf[user] += msg.value;
        emit Deposited(user, msg.value);
    }

    function withdraw(address user, uint256 amount) public override onlyBroker {
        require(amount > 0, "amount must be more than zero");
        require(balanceOf[user] >= amount, "not enough balance");
        balanceOf[user] -= amount;
        emit Withdrawn(user, amount);
        (bool ok, ) = payable(user).call{value: amount}("");
        require(ok, "transfer failed");
    }
}
