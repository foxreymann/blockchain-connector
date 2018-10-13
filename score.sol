pragma solidity ^0.4.21;

contract Score {
    uint score;
    address owner; // defaults to 0
    
    event ScoreSet(uint);
 
    modifier onlyOwner(){
        if(msg.sender==owner) {
            _; // invoke the function
        }
    }

    constructor () public {
        owner = msg.sender;
    }
 
    function getScore() public view returns(uint){
        return score;
    }   
    
    function setScore(uint _newscore) public onlyOwner returns(uint) {
        score = _newscore;
        emit ScoreSet(score);
        return score;
    }
}