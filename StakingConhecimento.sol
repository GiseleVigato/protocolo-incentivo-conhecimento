// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract StakingConhecimento is Ownable, ReentrancyGuard {
    IERC20 public learnToken;
    IERC721 public certificadoNFT; // Referência ao NFT da Gisele
    AggregatorV3Interface internal priceFeed;

    struct Estudo {
        uint256 quantidadeTokens;
        uint256 inicioDoEstudo;
    }

    mapping(address => Estudo) public alunos;

    constructor(address _learnToken, address _nftAddress, address _priceFeed, address initialOwner) 
        Ownable(initialOwner) 
    {
        learnToken = IERC20(_learnToken);
        certificadoNFT = IERC721(_nftAddress);
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    function obterPrecoETH() public view returns (int256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return price;
    }

    function iniciarJornada(uint256 _quantidade) public nonReentrant {
        require(_quantidade > 0, "Quantidade invalida");
        learnToken.transferFrom(msg.sender, address(this), _quantidade);
        alunos[msg.sender] = Estudo(_quantidade, block.timestamp);
    }

    function concluirJornada() public nonReentrant {
        Estudo storage dados = alunos[msg.sender];
        require(dados.quantidadeTokens > 0, "Nenhuma jornada ativa");

        int256 precoETH = obterPrecoETH();
        uint256 bonusPercentual = 15; // Base de 15%

        // LÓGICA DE MULTIPLICADOR: 
        // Se o aluno tiver o CertificadoNFT OU o ETH estiver acima de $2500
        if (certificadoNFT.balanceOf(msg.sender) > 0 || precoETH > 2500 * 10**8) {
            bonusPercentual = 20;
        }

        uint256 bonus = (dados.quantidadeTokens * bonusPercentual) / 100;
        uint256 total = dados.quantidadeTokens + bonus;

        delete alunos[msg.sender];
        learnToken.transfer(msg.sender, total);
    }
}