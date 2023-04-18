// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Linea {
  
  address public owner;

   constructor() {
        owner = msg.sender;
    }


   modifier onlyOwner() {
        require(msg.sender == owner, "not an owner!");
        _;
  }

    string public greet = "Hello from Phratry DAO";

    function pay() external payable {}

    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
