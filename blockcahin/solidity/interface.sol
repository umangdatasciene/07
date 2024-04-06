// construcutor.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// or
// pragma solidity ^0.5.17;

interface A {
    function getResult() external view returns (uint);
}

contract B is A {
    function getResult() external pure returns (uint) {
        uint a = 200;
        uint b = 100;
        uint result = a - b;
        return result;
    }
}
