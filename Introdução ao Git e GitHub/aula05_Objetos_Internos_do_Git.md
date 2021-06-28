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

## Objetos

O Git tem 3 objetos básicos:

* Blobs
* Trees
* Commits

### Blobs

O Git utiliza o SHA1 para fazer a encriptação do nosso arquivo, mas se a gente for gerar esse código SHA1 de forma manual, que em teoria deveria ser igual ao que o Git gera, teremos um resultado diferente. Por que?

Isso porque o Git não armazena nosso arquivo de modo direto. Ele primeiro gera um Objeto ao qual ele dá o nome de Blob. Nesse blob, ele vai armazenar não só o conteúdo do nosso arquivo, mas também o tamanho dele. Por esses "caracteres" extras que ele usa para gerar o arquivo armazenado, temos essa diferença.

Pense no Blob como um arquivo separado, que vai guardar o conteúdo do seu arquivo original, o tamanho dele, e tem o seu código SHA1.

### Trees

As trees, por sua vez, armazenam um conjunto de blobs. Se formos pensar de uma forma um pouco mais abstrata, ela seria como uma pasta do nosso computador.

As pastas guardam arquivos e também outras pastas, correto?

Da mesma forma, uma tree pode guardar os blobs e também outras trees. Alem disso tudo, a tree também armazena o tamanho de todo o conjunto que ela possui e o nome dos arquivos originais, e também possui um código SHA1 próprio dela.

Abaixo, você pode ver um esquema ilustrado de como seria o conteúdo de uma tree. Perceba que ela tem arquivos dentro dela, como o *README*, o *Rakefile* e uma pasta chamada *lib*. Os arquivos são objetos do tipo blob, já a pasta é uma outra tree, e tem dentro de si outro arquivo, ou seja, objeto blob.

![esquema de uma tree](https://git-scm.com/book/en/v2/images/data-model-1.png)

### Commit

O Commit é o objeto maior de toda essa estrutura.

Quando queremos criar uma nova versão do nosso projeto para ser armazenado pelo Git, nós mandamos ele criar um Commit.

Esse Commit vai centralizar toda a informação, contendo todas as trees do seu projeto, com todos os blobs criados para cada documento do seu projeto, além de guardar informações extras como código do Commit anterior a ele, que é conhecido como *Parent*, o tamanho do objeto total, o nome do autor do Commit, uma mensagem criada pelo autor explicando o que foi alterado e uma timestamp, que seria os dados de data e hora de criação do Commit.

Nessa altura do campeonato, nem é preciso dizer que o Commit também recebe um código SHA1, né? Pois então. Esse SHA1 do commit também recebe o nome de Hash, e representa os dados totais do projeto.

## O encontro de tudo

A beleza vem agora.

Lembra que laaaa na hora de criar o SHA1 do blob, daquele arquivozinho de texto que tem dentro do seu projeto gigante, ele é criado com base no conteúdo? E que todos os SHA1 também são criados de acordo com o conteúdo?

Então, se mudarmos uma vírgula de um único arquivo, o SHA1 dele vai ser alterado. Isso vai alterar os dados do blob deste arquivo, que também vai acabar alterando o SHA1 da tree onde este arquivo está, e vai gerar um novo código pra ela. Por sua vez, o Commit também deverá receber um valor SHA1 novo, porque o dado da tree que ele armazenava alterou. Percebe? Dessa forma simples, todo o objeto que vai armazenar o projeto quando fizermos um novo Commit, vai receber um código novo, único.

Isso permite ao Git perceber essas alterações com extrema facilidade e velocidade, comparando apenas o código SHA1 ao invés de ter que percorrer todos os dados de todos os documentos.

Além disso, o novo Commit que dermos pra mudar essa simples vírgula vai guardar o código do Commit anterior como seu *parent*, e se quisermos acessar essa versão antiga, basta utilizarmos esse código. E nessa versão antiga, vai ter o parent desse parent. E na outra também, o parent do parent do parent... Que doideira, temos toda uma linha do tempo organizadinha!

## Sistema distribuído e Seguro

O Git é um sistema distribuído porque permite que o mesmo projeto possa ser utilizado por várias pessoas, em várias máquinas, de forma isolada.

Esse princípio também garante a segurança, pois se algo acontecer com a sua cópia, na sua máquina, ou no servidor principal onde toda a equipe mantém o código armazenado de forma centralizada, você ainda conta com a versão presente nos demais computadores dos demais usuários, distribuídos e sem ligação crítica que faça a perda de um gerar perda para todos os demais
