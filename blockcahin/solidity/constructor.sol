// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Hello {
    string public greet;

    constructor() {
        greet = "Hey there!";
    }

    // memory use to store temp data
    function setGreet(string memory newGreet) public {
        greet = newGreet;
    }
}
