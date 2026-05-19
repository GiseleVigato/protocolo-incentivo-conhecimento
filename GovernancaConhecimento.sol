// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GovernancaConhecimento is Ownable {
    IERC20 public learnToken;

    struct Proposta {
        string descricao;
        uint256 votosFavoraveis;
        uint256 votosContra;
        bool executada;
    }

    Proposta[] public propostas;
    mapping(uint256 => mapping(address => bool)) public jaVotou;

    constructor(address _learnToken, address initialOwner) Ownable(initialOwner) {
        learnToken = IERC20(_learnToken);
    }

    function criarProposta(string memory _descricao) public onlyOwner {
        propostas.push(Proposta(_descricao, 0, 0, false));
    }

    function votar(uint256 _propostaId, bool _apoiar) public {
        require(_propostaId < propostas.length, "Proposta inexistente");
        require(!jaVotou[_propostaId][msg.sender], "Voce ja votou");
        
        uint256 poderDeVoto = learnToken.balanceOf(msg.sender);
        require(poderDeVoto > 0, "Voce precisa de LearnTokens para votar");

        if (_apoiar) {
            propostas[_propostaId].votosFavoraveis += poderDeVoto;
        } else {
            propostas[_propostaId].votosContra += poderDeVoto;
        }

        jaVotou[_propostaId][msg.sender] = true;
    }
}