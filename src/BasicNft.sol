// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import  { ERC721 } from '@openzeppelin/contract/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    //Add token counter
    uint256 private s_tokenCounter;
    
    //Get token id and return a tokenUri(string)
    mapping(uint256 => string) private s_tokenIdToUri;
    constructor() ERC721('Dogie', 'DOG') {
        s_tokenCounter = 0;

    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter); // need to get the balance after mint
        s_tokenCounter++;

    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        return s_tokenIdToUri[tokenId];
    }

}