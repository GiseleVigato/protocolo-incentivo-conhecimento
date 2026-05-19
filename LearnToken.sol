// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LearnToken is ERC20, Ownable {
    
    // Ajuste: Adicionamos uma vírgula entre os inicializadores
    constructor(address initialOwner) 
        ERC20("LearnToken", "LTK") 
        Ownable(initialOwner) 
    {
        // Cria 1.000.000 de tokens iniciais para a Gisele
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}