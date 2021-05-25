pragma solidity ^0.6.4;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        string cityabbr;
    }


    mapping(uint256 => City) public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping(address => bool) hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 2; // number of city added
    constructor() public {
        
        owner=msg.sender;
        cities[1].cityName="kathmandu";
        cities[1].vote=0;
        cities[2].cityName="butwal";
        cities[2].vote=0;
    
    //TODO set contract caller as owner
    //TODO set some intitial cities.
    }
 
 
    function addCity(string memory _cityname) public {
      //  TODO: add city to the CityStruct
      cityCount++;
      require(owner==msg.sender,"not authorized");
      cities[cityCount].cityName=_cityname;
      cities[cityCount].vote=0;
      
      
      

    }
    
    function vote(uint256 _id) public {
        
        require(!hasVoted[msg.sender],"has already voted");
        cities[_id].vote++;
        hasVoted[msg.sender]=true;

        
        //TODO Vote the selected city through cityID

    }
    function getCity(uint256 _id) public view returns (string memory) {
        // TODO get the city details through cityID
        return cities[_id].cityName;
    }
    function getVote(uint256 _id) public view returns (uint256) {
        // TODO get the vote of the city with its ID
        return cities[_id].vote;
    }
}
