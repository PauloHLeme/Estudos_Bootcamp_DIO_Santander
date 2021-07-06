# Transações, um dos principais conceitos de um Banco de Dados

_**Aula ministrada por Daniel Costa**_

_**Anotações por Paulo Henrique Leme**_

## O que são transações?

Conceito fundamental de todos os sistemas de bancos de dados. É um conceito de múltiplas etapas e códigos reunidos em apenas uma única transação, onde o resultado precisa ser **tudo ou nada**, ou seja, ou todo o processo acontece, ou nada é feito.

Dessa forma, se nenhum erro ocorrer, o processo é finalizado e todas as alterações são feitas.

Agora, caso no final de um processo longo algo dê errado, todas as mudanças que haviam sido feitas serão desfeitas, e nada do código vai ser atualizado.

Para isso, temos um estado inicial (begin) e um comando que envia a alteração final (commit). Caso tenha acontecido algo errado, ao invés do commit acontecer, tudo é desfeito (rollback).

Podemos inserir pontos a serem salvos em um comando (savepoint). Nesse caso, se ocorrer um erro, ao invés do rollback ser total, ele vai parar no ponto que você decidiu salvar (savepoint)

### Exemplo

```
BEGIN;
UPDATE funcionarios SET gerente = 2 WHERE id = 3;
SAVEPOINT sf_func;
UPDATE funcionarios SET gerente = null;
ROLLBACK TO sf_func;
UPDATE funcionarios SET gerente = 3 WHERE id = 5;
COMMIT;
```

Para utilizarmos os savepoints, basta declararmos onde o código terá o Savepoint e darmos um nome para ele, para podermos chamar o Rollback dando o nome do Savepoint!
