# 🎓 Protocolo de Incentivo ao Conhecimento - Web3 MVP

Este repositório armazena o MVP (Produto Mínimo Viável) de um protocolo descentralizado projetado para fomento acadêmico, distribuição automatizada de bolsas e governança universitária descentralizada, desenvolvido como avaliação para a disciplina de Web 3.0.

**Estudante:** Gisele Vigato  
**Orientador:** Prof. Bruno Portes  
**Rede de Implantação:** Ethereum Sepolia Testnet  

---

## 🏗️ Arquitetura do Protocolo e Escopo Técnico

O ecossistema foi estruturado utilizando contratos inteligentes modulares desenvolvidos em Solidity (^0.8.20), aplicando padrões industriais e seguros da biblioteca OpenZeppelin com restrições lógicas de acesso (`Ownable`) e barreiras contra vetores de reentrância (`ReentrancyGuard`).

A engenharia operacional do protocolo divide-se em quatro componentes principais integrados:

1. **Tokenômica Acadêmica (ERC-20):** Gestão e emissão do `LearnToken (LTK)`, um token utilitário usado para bonificação de alunos por mérito pedagógico e dedicação institucional.
2. **Reconhecimento de Conquistas (ERC-721):** Emissão do `CertificadoNFT (CERT)`, um selo/certificado acadêmico imutável e intransferível que comprova o êxito do estudante em módulos avançados.
3. **Mecanismo de Dedicação Acadêmica (Staking):** Contrato que permite o bloqueio voluntário de LearnTokens (`StakingConhecimento`) simulando uma jornada de estudos. Este contrato consome dados de um **Oráculo Descentralizado da Chainlink** (Price Feed ETH/USD) em tempo real, aplicando multiplicadores de recompensas para proteger o poder de compra do aluno ou impulsionar os ganhos de quem detém o Certificado NFT de prestígio.
4. **Conselho Universitário Descentralizado (DAO):** Sistema de governança acadêmica (`GovernancaConhecimento`) onde a reitoria propõe diretrizes e os estudantes utilizam seus saldos de LearnTokens para votar de forma ponderada e transparente.

---

## 📍 Endereços Oficiais dos Contratos (Sepolia Testnet)

Os contratos foram validados e implantados integralmente na rede de testes pública. O histórico de transações e códigos verificados podem ser auditados nos links do Etherscan abaixo:

* **Token LearnToken (ERC-20):** `0xd999bfAE1d813e6f35B46f0dd84CA007B5334ef4`  
  [Visualizar no Etherscan](https://sepolia.etherscan.io/address/0xd999bfAE1d813e6f35B46f0dd84CA007B5334ef4)

* **CertificadoNFT (ERC-721):** `0xd3d17C7bb1DF2553990973969337bb22682AA3A0`  
  [Visualizar no Etherscan](https://sepolia.etherscan.io/address/0xd3d17C7bb1DF2553990973969337bb22682AA3A0)

* **Contrato de Staking Acadêmico:** `0x45bd42C2D843B80FE091917f694F1c72Ebc16eA8`  
  [Visualizar no Etherscan](https://sepolia.etherscan.io/address/0x45bd42C2D843B80FE091917f694F1c72Ebc16eA8)

* **Governança Universitária (DAO):** `0x291410D69A339B521c7501a2E3F87df7e7932CC8`  
  [Visualizar no Etherscan](https://sepolia.etherscan.io/address/0x291410D69A339B521c7501a2E3F87df7e7932CC8)

---

## 🛡️ Relatório de Auditoria de Segurança e Compilação

Buscando resguardar o protocolo contra falhas de estouro de pilha ou falhas de lógica, as seguintes verificações foram executadas e anexadas à raiz deste repositório:

* **Hardhat Compiler (`relatorio-hardhat.txt`):** Validação de integridade atestando a compilação paralela de 25 arquivos de dependência Solidity para o ambiente EVM alvo (Target: Cancun).
* **Slither Analysis (`relatorio-slither.txt`):** Auditoria estática automatizada focada na detecção de reentrância em chamadas externas e checagem de integridade de tipos matemáticos nas operações internas.

---

## 🎬 Vídeo Demonstrativo
[Assista aqui à demonstração prática do protocolo](https://youtu.be/iJ_DSKsjCJY)

---

## 💻 Como Executar e Testar a Interface Web3 (Frontend)

O painel do aluno e da reitoria foi desenvolvido utilizando HTML e JavaScript nativos, alimentados assincronamente pela biblioteca **Ethers.js (v6)** para comunicação direta com carteiras de extensão baseadas em navegadores.

### Pré-requisitos
1. Extensão **MetaMask** instalada no navegador.
2. Conexão ativa com a rede de testes **Ethereum Sepolia**.
3. Frações mínimas de Sepolia ETH (testnet) para custeio das taxas de mineração (*gas*).

### Instruções de Execução
1. Faça o clone ou o download do ZIP deste repositório em seu ambiente de desenvolvimento.
2. Navegue até a pasta raiz e localize o arquivo `index.html`.
3. Abra o arquivo diretamente em seu navegador web de preferência (Chrome, Brave, Firefox, Edge).
4. Utilize a interface visual conectando sua carteira para disparar as rotinas de mint de certificados, abertura de jornadas (stake) e apuração de votos do conselho descentralizado.
