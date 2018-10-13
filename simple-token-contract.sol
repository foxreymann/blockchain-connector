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
    }
        
    function totalSupply() public view returns (uint256) {
        return noOfTokens;
    }
    
    function balanceOf(address _owner) public view returns (uint256 ) {
        // check accountsAddresses for address
        
        // return 0 or balance
        return noOfTokens;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool) {
        // add to accountsAddresses
        emit Transfer(msg.sender, _to, _value);
        accounts[_to] += _value;
    }
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

}