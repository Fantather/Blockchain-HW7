// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract BalanceBook {
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function transfer(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function _mint(address to, uint256 amount) internal {
        totalSupply += amount;
        balanceOf[to] += amount;
        emit Transfer(address(0), to, amount);
    }

    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(to != address(0), "zero address");
        require(balanceOf[from] >= amount, "not enough balance");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
    }
}
