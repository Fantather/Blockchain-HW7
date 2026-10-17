// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IVault.sol";

contract Broker {
    IVault public immutable vault;

    constructor(address vaultAddress) {
        require(vaultAddress != address(0), "zero address");
        vault = IVault(vaultAddress);
    }

    function deposit() public payable {
        vault.deposit{value: msg.value}(msg.sender);
    }

    function withdraw(uint256 amount) public {
        vault.withdraw(msg.sender, amount);
    }

    function balanceOf(address user) public view returns (uint256) {
        return vault.balanceOf(user);
    }
}
