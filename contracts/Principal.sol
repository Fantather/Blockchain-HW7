// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Teacher.sol";
import "./Mentor.sol";

contract Principal is Teacher, Mentor {
    function role() public pure override(Teacher, Mentor) returns (string memory) {
        return "principal";
    }

    function baseRole() public pure returns (string memory) {
        return super.role();
    }
}
