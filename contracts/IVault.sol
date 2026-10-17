// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVault {
    function balanceOf(address user) external view returns (uint256);

    function deposit(address user) external payable;

    function withdraw(address user, uint256 amount) external;
}
