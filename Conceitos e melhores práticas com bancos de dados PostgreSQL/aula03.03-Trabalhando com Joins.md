# Trabalhando com Joins

_**Aula ministrada por Daniel Costa**_

_**Anotações por Paulo Henrique Leme**_

## O que são JOINS?

JOINs são comandos para realizar a união de tabelas nas nossas consultas. Existem vários tipos de JOIN, retornando os dados de uma determindada maneira:
Normalmente relacionamos os dados da PK de uma tabela com a FK dela na outra tabela. Isso limita os gastos de recurso e garante melhor performance.

* JOIN (INNER JOIN): Retorna os dados que refletem APENAS os registros que contém a relação.

```
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT count(distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;
```

* LEFT JOIN (LEFT OUTER JOIN): Retorna TODOS os dados da tabela da esquerda e APENAS os dados que contém a relação da tabela da direita. Caso exista dados na tabela 1 sem relação com a tabela 2, o campo da tabela 2 recebe valor nulo.

```
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;
```

* RIGHT JOIN (RIGHT OUTER JOIN): Retorna APENAS os dados da tabela da esquerda que contém a relação e TODOS os dados da tabela da direita. Caso exista dados na tabela 2 sem relação com a tabela 1, o campo da tabela 1 recebe valor nulo.

```
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco ON banco.numero = agencia.banco_numero;
```

* FULL JOIN (FULL OUTER JOIN): Retorna TODOS os dados de ambas as tabelas, retornando valor nulo para os campos sem relação. Mais utilizado para gerar relatórios completos, desencorajado para uso no dia a dia.

```
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;
```

* CROSS JOIN: Todos os dados de uma tabela serão cruzados com todos os dados da tabela referenciada, criando uma matriz. Consome muito recurso. Deve ser utilizado de forma beeeeem específica.

```
SELECT tbla.valor, tblb.valor
FROM teste_a tbla
cross join teste_b tblb;
```

### JOIN Completo

Podemos ainda fazer um JOIN de várias tabelas, apenas relacionando os campos que se repetem como FK nas outras tabelas:

```
SELECT 	banco.nome,
		agencia.nome,
		conta_corrente.numero,
		conta_corrente.digito,
		cliente.nome
FROM banco
JOIN agencia
	ON agencia.banco_numero = banco.numero
JOIN conta_corrente
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero;
```
