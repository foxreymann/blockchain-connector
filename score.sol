pragma solidity ^0.4.21;

contract Score {
    uint score;
    address owner; // defaults to 0
 
    modifier onlyOwner(){
        if(msg.sender==owner) {
            _; // invoke the function
        }
    }
 
    function getScore() public view returns(uint){
        return score;
    }   
    
    function setScore(uint _newscore) public onlyOwner returns(uint) {
        score = _newscore;
        return score;
    }
}