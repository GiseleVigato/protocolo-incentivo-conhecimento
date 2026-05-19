// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CertificadoNFT is ERC721, Ownable {
    uint256 private _nextTokenId;

    constructor(address initialOwner) 
        ERC721("CertificadoConhecimento", "CERT") 
        Ownable(initialOwner) 
    {}

    // Função para emitir o certificado para um aluno
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
}