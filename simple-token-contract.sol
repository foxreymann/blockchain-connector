pragma solidity ^0.4.0;
contract SimpleToken{
    
    address owner; // defaults to 0
    uint256 noOfTokens;
    string symbol;
    mapping (address => uint) accounts;
    address[] public accountsAddresses;
 
    constructor (uint256 _noOfTokens, string _symbol) public {
        owner = msg.sender;
        noOfTokens = _noOfTokens;
        symbol = _symbol;
        accounts[owner] = noOfTokens;
    }
    
    modifier hasEnoughBalance(address _from, uint256 _value){
        if(accounts[msg.sender] >= _value) {
            _; // invoke the function
        }
    }
        
    function totalSupply() public view returns (uint256) {
        return noOfTokens;
    }
    
    function balanceOf(address _owner) public view returns (uint256 ) {
        return accounts[_owner];
    }
    
    function transfer(address _to, uint256 _value) public  hasEnoughBalance(msg.sender, _value) returns (bool) {
        accounts[_to] += _value;
        accounts[msg.sender] -= _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

}