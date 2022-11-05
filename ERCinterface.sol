// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //compiler version

interface IERC20{ //declaration of the interface keyword and name. The name must begin with an I

    function totalSupply() external view returns(uint); //is denoted in uint and set to return the total number of tokens. 
    function balanceOf(address account) external view returns(uint); //this returns the token balance available in our wallet. Takes in the owners address and returns a uint.
    function transfer(address recipient, uint amount) external returns(bool); //this enales tokens to be transferred. It takes in the recipient's address and the amount to be transferred.
    function allowance(address owner, address spender) external view returns(uint); //this grants access for money to be taken from an account. It takes in the owner's address and the address of the recipient.
    function approve(address sender, uint amount) external returns(bool); //this function approves the spender's address to receive token rom the owner. It takes in the address of the spender and the amount to be received. 

    function transferFrom(address sender, address recipient, uint amount) external returns(bool); //this allows tokens to be transferred from the sender's address to the recipient's address

    event Transfer(address indexed from, address indexed to, uint amount); //this takes in the address where the money will be made from, the recipient's address amd the amount.

    event Approval(address indexed owner, address indexed spender, uint amount); //this takes in the owner's address, the address of the approved spender and the amount.

}
