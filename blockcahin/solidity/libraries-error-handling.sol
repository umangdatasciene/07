// util.sol file
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

library Util {
    function concat(
        string memory x,
        string memory y
    ) public pure returns (string memory) {
        return string.concat(x, y);
    }

    function add(uint x, uint y) public pure returns (uint) {
        return x + y;
    }
}

// test.sol file
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "util.sol";

contract ImportHere {
    using Util for uint;
    using Util for string;

    function sum(uint a, uint b) public pure returns (uint) {
        return a.add(b);
    }

    function concat(
        string memory x,
        string memory y
    ) public pure returns (string memory) {
        return x.concat(y);
    }
}

// error handling
// require
contract requireStatement {
    function checkInput(uint _input) public pure returns (string memory) {
        require(_input >= 0, "invalid uint8");
        require(_input <= 255, "invalid uint8");
        return "Input is Uint8";
    }

    function odd(uint _input) public pure returns (bool) {
        require(_input % 2 != 0);
        return true;
    }
}

// assert
contract assertStatement {
    bool result;
    function checkOverflow(uint _num1, uint _num2) public {
        uint sum = _num1 + _num2;
        assert(sum <= 255);
        result = true;
    }

    function getResult() public view returns (string memory) {
        if (result == true) {
            return "No Overflow";
        } else {
            return "Overflow exist";
        }
    }
}

// revert
contract revertStatement {
    function checkOverflow(
        uint _num1,
        uint _num2
    ) public pure returns (string memory, uint) {
        uint sum = _num1 + _num2;
        if (sum < 0 || sum > 255) {
            return ("Overflow", sum);
            revert(" Overflow Exist");
        } else {
            return ("No Overflow", sum);
        }
    }
}
