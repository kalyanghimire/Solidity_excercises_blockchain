pragma solidity ^0.5.1;

contract ProofOfExistence3 {

    mapping (bytes32 => bool) private proofs;

  
      // store a proof of existence in the contract state
    function storeProof(bytes32 proof) 
    internal 
    {
        address stored_adress = msg.sender;
        uint256 stored_on = block.timestamp
        
    }
  
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
  
  // helper function to get a document's keccak256 hash
  function proofFor(string memory document) 
    pure 
    private 
    returns (bytes32) 
  {
      return keccak256(abi.encodePacked(document));
 
  }
  
  // check if a document has been notarized
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
