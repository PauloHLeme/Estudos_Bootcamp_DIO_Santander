# Aula 02 - O que são algoritmos e pseudocódigo

_aula ministrada por **Professor Denilson Bonatti**_
_anotações por **Paulo Henrique Leme**_

## O que é algoritmo?

O algoritmo nada mais é do que uma _sequencia de passos que resolve um problema._ Parece uma explicação simplória, mas é a mais simples essência do que o algoritmo é. Como exemplo, vamos ver como seria a Rotina do nosso dia:

```
Início-dia
    Acordei
    Levantei da cama
    Troquei de roupa
    Escovei os dentes
    Fui a padaria
    Tomei café
    Escovei os dentes
    Fui ao trabalho
    ...
Fim-dia
```

Esse exemplo simples descreve de forma bem objetiva o que é e como funciona um algoritmo. Nele, nós temos:

1. Início-dia
Toda rotina, toda tarefa, tem um início, e essa linha nos indica que o dia está começando.

2. Atividades
Em sequência lógica, temporal, mostrando em uma lista de atividades o que é feito primeiro, o que vem em seguida, e assim sucessivamente, vamos listando todos os itens que compõem nosso dia.
Vale observar que mudar a ordem dos itens fará você realizar as tarefas em ordem inversa, o que pode gerar complicações, ou até mesmo não funcionar, como por exemplo levantar antes de acordar, seu sonâmbulo!

3. Fim-dia
Assim como toda tarefa começa, ela também acaba. Ou deveria. Se não acabar, você está em um loop temporal eterno. Que doideira!

## Hora do Minecraft!

[Clicando aqui](https://studio.code.org/s/mc/lessons/1/levels/1), você vai acessar o link para uma página que vai nos auxiliar no aprendizado de algoritmo através de um exercício bem visual, vamos lá!

Neste site, temos os comandos exibidos de forma parecida a um quebra cabeças, com cada peça representando um comando que passamos para o computador fazer. Ou seja, estamos falando para o computador uma lista de como executar as tarefas, a ordem que ele deve fazer as funções que nós mandamos.

Quando estiver pronto e nós clicarmos no botão `Executar`, o computador irá procurar o bloco que está escrito `Quando executar`, que ele vai entender como o **Início** da rotina, e então vai começar a seguir a ordem dos blocos, executando a **Atividade** que nós colocamos neste bloco, sempre na ordem que elas aparecem. Por fim, quando a lista de atividades acabar, ele vai entender que a rotina de atividades chegou ao **Fim**. Pronto! De forma bem visual, e sem dor, nós escrevemos um algoritmo, o computador entendeu, e executou!

### Comandos de repetição

Nessa atividade nós já temos a introdução do conteito de repetição de tarefas.

Algumas vezes (ou várias) nós temos atividades dentro de uma rotina que se repetem. Normalmente, teríamos que escrever essas atividades de forma repetida quantas vezes fossem necessárias. Mas o mundo da programação, assim como o mundo real, criou ferramentas para facilitar esse processo.

Na atividade 5 do site, nos é apresentado o bloco `Repita x vezes`, que nos permite colocar apenas uma vez as tarefas que serão repetidas e apenas dizer a quantidade de vezes que vamos repetir ela. Fácil né?

### Funções condicionais

As vezes nós temos certas tarefas que faremos apenas **se** alguma outra coisa acontecer.

Vamos pensar lá no nosso exemplo da rotina do dia. Nós levantamos, trocamos de roupa, escovamos os dentes, fomos na padaria e tomamos café. Mas não precisamos ir todos os dias na padaria, não é? A gente pode dizer que acorda, levanta, troca de roupa, escova os dentes, *se não tivermos café, vamos na padaria*, tomamos café.

Percebeu? No algoritmo, podemos colocar tarefas que são **condicionadas** a algo. Que vão acontecer ou não dependendo de um outro fator.

## Pseudocódigo

Pseudocódigo é uma forma genérica de escrever um algoritmo, utilizando uma linguagem simples, nativa (ou seja, em português) a quem o escreve de forma a ser entendida por qualquer pessoa.

O pseudocódigo serve exatamente para escrevermos a nossa lógica, o nosso algoritmo, mas sem utilizar uma linguagem de programação, que ainda não conhecemos ou dominamos, mas com a forma de se escrever (conhecida como sintaxe) bem parecida com o que fazemos no dia a dia da codificação.

## Lobo, ovelha e repolho

[Clicando neste link](https://www.proprofsgames.com/wolf-sheep-and-cabbage/) você será direcionado para um site com mais um jogo com propósito de nos ensinar, de forma prática, um pouco de lógica.

Depois de resolver esse problema, vamos criar um algoritmo simples, em um arquivo de texto mesmo, listando o passo a passo utilizado para conseguir resolver o problema.
Pense em cada clique dado no jogo como uma linha do seu pseudocódigo. Não se esqueça de indicar o Início do Jogo e o Final do Jogo!

```
INICIO DO JOGO
    Ovelha entra no barco
    Atravessa
    Ovelha sai do barco
    Atravessa
    Repolho entra no barco
    Atravessa
    Repolho sai do barco
    Ovelha entra no barco
    Atravessa
    Ovelha sai do barco
    Lobo entra no barco
    Atravessa
    Lobo sai do barco
    Atravessa
    Ovelha entra no barco
    Atravessa
    Ovelha sai do barco
FIM DO JOGO
```

## Exercícios

1. Crie um algoritmo do seu dia

2. Abra o site [clicando neste link](https://studio.code.org/s/mc/stage/1/puzzle/1) e tente resolver todos os problemas em menos de uma hora

## IMPORTANTE!!!

Se você conseguir realizar a atividade 2 em menos de uma hora, você PRECISA acessar o [Instagram](https://www.instagram.com), e faça uma postagem marcando os perfis @digitalinnovation.one e @denilsonbonatti e marque a #chupaDenilson pra mostrar que conseguiu!

3. Acesse [esse link](https://rachacuca.com.br/jogos/pinguins-numa-fria), resolva o problema e crie o pseudocódigo para indicar para alguém como resolver esse problema.

---
### Respostas

1
```
INÍCIO DIA
    Acordar
    Preparar Café
    Alimentar cães
    Tomar Café
    Estudar Mercado
    Tomar Banho
    Preparar Almoço
    Passar roupa da Esposa
    Levar Esposa no Serviço
    Voltar pra casa
    Limpar Casa
    Jantar
    Jogar no Computador
    Buscar Esposa no Serviço
    Voltar pra casa
    Tomar café da noite
    Assistir TV
    Dormir
FIM DIA
```

2
Várias respostas de acordo com cada atividade

3
```
INÍCIO JOGO
    FilhoAzul sobe
    PaiAzul sobe
    Atravessa
    PaiAzul desce
    Atravessa
    FilhoVerde sobe
    Atravessa
    FilhoAzul desce
    Atravessa
    PaiVerde sobe
    Atravessa
    PaiVerde desce
    Atravessa
    FilhoVermelho sobe
    Atravessa
    FilhoVerde desce
    Atravessa
    PaiVermelho sobe
    Atravessa
    PaiVermelho desce
    FilhoVermelho desce
FIM JOGO
```
