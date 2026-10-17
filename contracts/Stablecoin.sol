// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./BalanceBook.sol";

contract Stablecoin is BalanceBook {
    address public treasury;

    constructor(address treasuryWallet, uint256 initialSupply) {
        require(treasuryWallet != address(0), "zero address");
        treasury = treasuryWallet;
        _mint(msg.sender, initialSupply);
    }

    function _transfer(address from, address to, uint256 amount) internal override {
        uint256 fee = amount / 100;
        super._transfer(from, to, amount - fee);
        if (fee > 0) {
            super._transfer(from, treasury, fee);
        }
    }
}
