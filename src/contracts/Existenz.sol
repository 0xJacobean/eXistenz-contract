pragma solidity ^ 0.5.0;
pragma experimental ABIEncoderV2;

// import "./ERC721Full.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Enumerable.sol";

contract Existenz is ERC721Metadata, ERC721Enumerable {

  address[] public connections;
  // mapping(string => bool) _colorExists;
  string[] tokenUriArray;

  constructor() ERC721Metadata("eXistenz","EX") public {
  }

  function mint(address _connectionAddress, string memory _addressAsString) public {

  	// return index of new push 
    uint _id = connections.push(_connectionAddress);
    // mint token with connection address as owner
    _mint(_connectionAddress, _id);
    // uri is corresponding account address - for now!
  	_setTokenURI(_id, _addressAsString);

  }

  function listAllUri(address _ownerAddress) public returns (string[] memory) {
  	// get balance of for address 
    uint balanceOf = balanceOf(_ownerAddress);

    string[] memory tempTokenUriArray;
	tokenUriArray = tempTokenUriArray;
    for (uint i=0; i<balanceOf; i++) {
    	uint256 _tokenId = tokenOfOwnerByIndex(_ownerAddress, i);
    	string memory uri = this.tokenURI(_tokenId);
    	tokenUriArray.push(uri);
	}
	return tokenUriArray;
  }

}
