# Funções Agregadas em PostgreSQL

_**Aula ministrada por Daniel Costa**_

_**Anotações por Paulo Henrique Leme**_

## Funções agregadas

Funções agregadas são funções contidas dentro dos comandos do PostgreSQL para nos retornar informações sobre nossas tabelas de dados. Existem inúmeras funções, mas vamos estudar melhor as seguintes:

* AVG: média
`
```
SELECT AVG (valor) FROM cliente_transacoes;
```

* COUNT (opção: HAVING): contagem

```
SELECT COUNT (numero) FROM cliente;

SELECT COUNT (numero),email
FROM cliente
WHERE email ILIKE '%gmail.com'
GROUP BY email;

SELECT COUNT (id), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT (ID) >150;
```

* MAX: Maior número
```
SELECT MAX (valor)
FROM cliente_transacoes;
```

* MIN: Menor número

```
SELECT MIN (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;
```

* SUM: soma dos valores

```
SELECT SUM (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT SUM (valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id ASC;
```

Para a lista completa de funções agregadas, visite: [www.postgresql.org/docs/9.5/functions-aggregate.html](https://www.postgresql.org/docs/9.5/functions-aggregate.html)


## information_schema

É uma view que podemos utilizar que nos retorna dados sobre as tabelas do nosso DB. Se quisermos saber quais são as colunas que temos na tabela banco, por exemplo, basta pedirmos ao computador com o comando:

```
SELECT * FROM information_schema.columns
WHERE table_name = 'banco';

ou ainda

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'banco';
```
