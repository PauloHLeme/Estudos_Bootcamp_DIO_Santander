# Aula 04 - Entendendo como o Git Funciona

_aula ministrada por **Professor Gustavo Reis**_

_anotações por **Paulo Henrique Leme**_

## Conceitos Git

* SHA1
* Objetos fundamentais
* Sistema distribuído
* Segurança

## SHA1

SHA significa Secure Hash Algorithm (Algoritmo de Hash Seguro), e ele é um conjunto de funções hash criptográficas projetadas pela Agência Nacional de Segurança americana, a NSA.

Essa encriptação gera uma espécie de "código" do arquivo de 40 dígitos, e a cada vez que nós alteramos o código, ele gera esse código novamente. A grande vantagem dele é que esse código é gerado com base no conteúdo existente no arquivo. Dessa forma, cada alteração do arquivo gera um código diferente, mas, se nós gerarmos um arquivo idêntico ao que criamos antes, ele também gera um código idêntico aquela versão anterior.

O Git se utiliza disso para saber se houve ou não alterações nos documentos por exemplo, para realizar gravação de novas versões, bem como para recuperar versões antigas através desse código SHA1. Uma ferramenta poderosa no gerenciamento

Na próxima aula, vamos continuar a explorar os demais conceitos Git
