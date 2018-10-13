pragma solidity ^0.4.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract SimpleToken is Ownable{
    
    uint256 noOfTokens;
    uint256 limit;
    string symbol;
    mapping (address => uint) accounts;
    address[] public accountsAddresses;
 
    constructor (uint256 _noOfTokens, string _symbol) public {
        noOfTokens = _noOfTokens;
        symbol = _symbol;
        accounts[owner()] = noOfTokens;
    }
    
    modifier hasEnoughBalance(address _from, address _to, uint256 _value){
        if(accounts[msg.sender] >= _value) {
            _; // invoke the function
        } else {
            emit Transfer(msg.sender, _to, _value);
        }
    }
    
    modifier checkLimit(uint256 _value) {
        if(_value <= limit) {
            _;
        }
    }
    
    function setTransferLimit(uint256 _limit) public onlyOwner returns (bool) {
        limit = _limit;
        return true;
    }    
        
    function totalSupply() public view returns (uint256) {
        return noOfTokens;
    }
    
    function balanceOf(address _owner) public view returns (uint256 ) {
        return accounts[_owner];
    }
    
    function transfer(address _to, uint256 _value) public checkLimit(_value)  hasEnoughBalance(msg.sender, _to,  _value) returns (bool) {
        accounts[_to] += _value;
        accounts[msg.sender] -= _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event TransferFail(address indexed _from, address indexed _to, uint256 _value);

}