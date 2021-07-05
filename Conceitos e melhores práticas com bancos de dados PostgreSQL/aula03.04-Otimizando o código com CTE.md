# Otimizando o código com CTE

_**Aula ministrada por Daniel Costa**_

_**Anotações por Paulo Henrique Leme**_

## CTE

CTE é uma sigla para Commom Table Expression. É uma forma auxiliar de organizar "statemente", ou seja, blocos de códigos, para consultas muito grandes, gerando tabelas temporárias e criando relacionamentos entre elas.

Dentro dos statements podem ter SELECTs, INSERTs, UPDATEs ou DELETEs.

## WITH STATEMENTS

O comando WITH serve para criar tabelas temporárias contendo apenas os dados relevantes para nós no momento, e que podemos usar para executar SELECTs ou JOINs com outras tabelas.

Nós até podemos fazer isso utilizando SELECTs e JOINs, mas se fizermos com o WITH, temos a possibilidade de realizar alterações internas no nosso SQL sem ter que ficar mexendo na Query (consulta) que o nosso programa irá fazer.

```
WITH tbl_tmp_banco AS(
	SELECT numero, nome
	FROM banco
)
SELECT numero, nome
FROM tbl_tmp_banco;

WITH params AS(
	SELECT 213 AS banco_numero
), tbl_tmp_banco AS(
	SELECT numero, nome
	FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome
FROM tbl_tmp_banco;

WITH clientes_e_transacoes AS(
	SELECT	cliente.nome AS cliente_nome,
			tipo_transacao.nome AS tipo_transacao_nome,
			cliente_transacoes.valor AS tipo_transacao_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes;
```
