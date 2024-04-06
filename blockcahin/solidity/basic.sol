// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// contracts
contract GetLoan {
    // no use, use get or set to interact with other contract
    function TakeLoan(uint256) external payable {
        GiveLoan loan = new GiveLoan(350);
    }
}

contract GiveLoan {
    uint public money;

    constructor(uint _amount) public {
        money = _amount;
    }
}

contract Variables {
    int256 public signNum;
    bool public isTrue;
    address public walletAddress;
    uint256[3] public fixArray;
    string public message;
    enum STATUS {
        pending,
        approved
    }
    STATUS public currentStatus;

    constructor() {
        signNum = -45;
        isTrue = true;
        walletAddress = msg.sender;
        fixArray = [1, 2, 3];
        currentStatus = STATUS.pending;
        message = "Initial message!";
    }

    function updateVariables() public {
        signNum = -20;
        isTrue = false;
        walletAddress = msg.sender;
        fixArray[2] = 4;
        currentStatus = STATUS.approved;
        message = "Updated message!";
    }
}

contract Operations {
    uint256 public num1;
    uint256 public num2;
    uint256 public result;

    function setNumber(uint256 _num1, uint256 _num2) public {
        num1 = _num1;
        num2 = _num2;
    }
    function add() public returns (uint256) {
        result = num1 + num2;
        return result;
    }
    function divide() public returns (uint256) {
        require(num2 != 0, "Oops! Can't divide a number by 0.");
        result = num1 / num2;
        return result;
    }
}

contract WhileLoop {
    uint256 public counter;
    function increment(uint256 _iterations) public {
        uint256 i = 0;
        while (i < _iterations) {
            counter++;
            i++;
        }
    }
}

contract DecisionMaking {
    uint256 public num;
    function setNumber(uint256 _num) public {
        num = _num;
    }
    function check() public view returns (string memory) {
        if (num % 2 == 0) {
            return string.concat("The number entered number is even.");
        }
        return string(abi.encodePacked("The number entered number is odd."));
    }
}

contract Mapping {
    mapping(address => uint) balance;
    mapping(address => string) name;

    function updateBalance() public returns (uint) {
        balance[msg.sender] = 20;
        return balance[msg.sender];
    }
    function senderInfo() public returns (string memory) {
        name[msg.sender] = "Sameera";
        return name[msg.sender];
    }
    function printSender() public view returns (address) {
        return msg.sender;
    }
}

// function
contract String {
    string public greet;
    constructor() {
        greet = "Hey there!";
    }
    function setGreet(string memory newGreet) public {
        greet = newGreet;
    }
}

// view
// cryptographic
contract GenerateKeccakHash {
    bytes32 private message;
    function setHash(string memory _message) public {
        message = keccak256(bytes(_message));
    }
    function getHash() public view returns (bytes32) {
        return message;
    }
}

// pure
contract PureFunction {
    function addMod() public pure returns (uint256) {
        return addmod(4, 5, 3);
    }
    function mulMod() public pure returns (uint256) {
        return mulmod(4, 5, 3);
    }
}

// fallback
// multiple contract
contract FallbackFunction {
    string public calledFallbackFun;
    fallback() external payable {
        calledFallbackFun = "I am Fallback Function";
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    receive() external payable {}
}

contract Sender {
    function transfer() public payable {
        require(msg.value >= 2 ether, "Insufficient ether sent");
        (bool sent, ) = payable(0xeF9B26046a2392C956320200eE0818543aA96aB7)
            .call{value: 2 ether}("Transaction Done");
        require(sent, "transaction Failed");
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// overloading
contract FunctionOverloading {
    function getSum(uint x, uint y) public pure returns (uint256) {
        return x + y;
    }
    function getSum(uint x, uint y, uint z) public pure returns (uint256) {
        return x + y + z;
    }
}

// mathematical
contract PrimeNumber {
    function checkIsPrimeNumber(
        int256 number
    ) public pure returns (string memory) {
        if (number <= 1) {
            return "Not Prime";
        }

        for (int256 i = 2; i <= number / 2; ++i) {
            if (number % i == 0) {
                return "Not Prime";
            }
        }

        return "Is Prime";
    }
}

// random
contract RandomNumber {
    uint randomNumber = 0;
    function setRandomNumber() public {
        randomNumber = uint(
            keccak256(abi.encodePacked(msg.sender, randomNumber))
        );
    }
    function getRandomNumber() public view returns (uint) {
        return randomNumber;
    }
}
