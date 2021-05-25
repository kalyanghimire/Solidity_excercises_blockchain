pragma solidity ^0.5.0;

contract ProofOfExistence2 {
    bytes32 private proofs;
    mapping(bytes32 => address) storedBy;
    mapping(bytes32 => uint256) storedOn;
    struct doc {
        address storedBy;
        uint256 storedOn;
        }
    function notarize(string memory document) public {
        proofs = proofFor(document);
        storedBy[proofs]=msg.sender;
        storedOn[proofs] = block.timestamp;
        }
    function proofFor(string memory document) public pure returns (bytes32) {
        return sha256(abi.encodePacked(document));
    }

      // check if a document has been notarized
      // *read-only function*
    function checkDocument(string memory document) 
    public 
    view 
    returns (bool) 
    {
        bytes32 pro =proofFor(document);
        if(storedOn[pro]!=0) {
            return true;}
        else{
        return  false;
        }
       
        
      }
    function hasProof(bytes32 proof) 
    internal 
    view 
    returns (bool) 
    {
    
        if(storedOn[proof]!=0){
            return true;}
        else{
            return false;
        }
    }
        
        
        
      }
