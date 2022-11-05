// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//import interface with the import keyword and filename
import "./ERCinterface.sol";

contract ERCtoken is IERC20{ //this contract inherits the interface with the keyword-is and the interface name

    uint public override totalSupply= 10**24; //serves as a state variable, public help us call the function outside our contract, override prevents error message
    mapping(address => uint) public override balanceOf; //contains an address and uint of the function balanceof
    mapping(address =>mapping(address => uint)) public override allowance; //contains two addresses, the address of the sender and the receiver and the amount. It is known as a nested mapping

    string public name = "Tech4dev"; //name of the token
    string public symbol = "T4D"; //symbol to be used by token
    uint public decimals = 18; //decimal

    function transfer(address recipient, uint amount) external override returns(bool){
        balanceOf[msg.sender] -= amount; //method1 is deducting the amount from senders balance
        balanceOf[recipient] += amount; //method2 is adding the amount to recipient's balance
        emit Transfer(msg.sender, recipient, amount);//this keyword broadcast the address  of the person calling the contract
        return true; //function returns true if successful
    }

    function approve(address spender, uint amount) external override returns(bool){//this function approves the spender to take out a certain amount 
        allowance[msg.sender][spender] = amount; //this allows the spender to get access to tokens from the owner
        emit Approval(msg.sender, spender, amount); //this broadcasts the approval made
        return true; //function returns true if successful
    }

    function transferFrom(address sender, address recipient, uint amount) external override returns(bool){//this function allows for token to be transferred from the owner to a recipient
        allowance[sender][msg.sender] -=amount; //this checks for the amount allowed to be sent
        balanceOf[sender] -=amount; //enables deduction of the amount from the sender
        balanceOf[recipient] +=amount; //enables addition of the amount to the recipient
        emit Transfer(sender, recipient, amount); //broadcasts the address of the sender, the address of the recipient and the amount
        return true; //function returns true if successful
    }
    function mint(uint amount) public{ //is used to create tokens and add the amount to the owner
        balanceOf[msg.sender] +=amount; //add the inputed amount into the callers balance
        totalSupply +=amount; //increase total supply by the amount inputted 
        emit Transfer(address(0), msg.sender, amount);//broadcast the function called
    }

    function burn(uint amount) public{//is used to destroy tokens, takes in uint to specify the amount 
        balanceOf[msg.sender] -=amount;//enables a deduction from the address of the person calling the contract 
        totalSupply -=amount;// enables a deduction from the total supply
        emit Transfer(msg.sender, address(0), amount);//broadcast the address and the amount
    }
}

