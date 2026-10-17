// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Teacher {
    function role() public pure virtual returns (string memory) {
        return "teacher";
    }
}
