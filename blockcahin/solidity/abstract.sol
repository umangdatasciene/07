// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// or
// pragma solidity ^0.5.17;

contract A {
    function getResult() public view returns (uint);
}

contract B is A {
    function getResult() public view returns (uint) {
        uint a = 100;
        uint b = 210;
        uint result = a * b;
        return result;
    }
}
