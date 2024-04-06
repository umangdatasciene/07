// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// single
contract Parent {
    uint internal sum;

    function setVal() external {
        uint a = 50;
        uint b = 20;
        uint c = 20;
        sum = a + b + c;
    }
}

contract child is Parent {
    function getVal() external view returns (uint) {
        return sum;
    }
}

contract SingleInheritance {
    child cc = new child();

    function Inherit() public returns (uint) {
        cc.setVal();
        return cc.getVal();
    }
}

// multiple
contract A {
    string internal x;
    string a = "Hey ";
    string b = "there ";

    function getA() external {
        x = string(abi.encodePacked(a, b));
    }
}

contract B is A {
    string public y;
    string c = "hero!";

    function getB() external payable {
        y = string(abi.encodePacked(x, c));
    }
}

contract C is B {
    function getC() external view returns (string memory) {
        return y;
    }
}

contract MultipleInheritance {
    C cc = new C();

    function testInheritance() public returns (string memory) {
        cc.getA();
        cc.getB();
        return cc.getC();
    }
}
