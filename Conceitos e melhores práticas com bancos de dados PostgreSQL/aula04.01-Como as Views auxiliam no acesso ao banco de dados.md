# Como as Views auxiliam no acesso ao banco de dados

_**Aula ministrada por Daniel Costa**_

_**Anotações por Paulo Henrique Leme**_

## Views

As Views são visões, "camadas" para as tabelas. São "apelidos" para uma ou mais queries. Elas também fornecem uma camada de proteção adicional, pois a view atua no lugar da tabela para o usuário acessar.

Aceitam comandos de SELECT, INSERT, UPDATE e DELETE.

```
CREATE [ OR REPLACE ] [ TEMP | TEMPORARY ] [RECURSIVE] VIEW name [ ( column_name [, ...] ) ]
    [ WITH ( view_option_name [= view_option_value] [, ... ] ) ]
    AS query
    [ WITH [ CASCADED | LOCAL ] CHECK OPTION ]
```

## Idempotência

### SELECT

```
CREATE OR REPLACE VIEW vw_bancos AS(
    SELECT numero, nome, ativo
    FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

CREATE OR REPLACE VIEW vw_bancos (banco_numero, banco_nome, banco_ativo) AS(
    SELECT numero, nome, ativo
    FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos;
```

### INSERT, UPDATE e DELETE

Os comandos INSERT, UPDATE e DELETE funcionam apenas para Views com 1 única tabela.

```
INSERT INTO vw_bancos (numero, nome, ativo) VALUES (100, 'Banco CEM', TRUE);

UPDATE vw_bancos SET nome = 'Banco 100' WHERE numero = 100;

DELETE FROM vw_bancos WHERE numero = 100;
```

## TEMPORARY

Colocar o comando TEMPORARY vai fazer com que o view seja temporário, sendo desfeito assim que a sessão for encerrada.

## RECURSIVE

É uma View que chama a si mesmo em um loop, e serve para nos trazer dados de forma hierárquica, por exemplo.

```
CREATE OR REPLACE RECURSIVE VIEW (nome_da_view)(campos_da_view) AS (
    SELECT base
    UNION ALL
    SELECT campos
    FROM tabela_base
    JOIN (nome_da_view)
);
```

## WITH OPTIONS

Podemos adicionar opções de checagem nas Views para validarmos inserções. No exemplo abaixo, só permitimos caso o ativo seja verdadeiro. Então quando tentarmos adicionar os valores BANCO CEM com o ativo FALSE, teremos um erro, pois nossa view está bloqueando.
```
CREATE OR REPLACE VIEW vw_bancos AS(
    SELECT numero, nome, ativo
    FROM banco
    WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTION;

INSERT INTO vw_bancos (numero, nome, ativo) VALUES (100, 'Banco CEM', FALSE)
```

Podemos também ter várias views fazendo referências uma as outras. Nesse caso, se colocarmos WITH LOCAL CHECK OPTION apenas na última delas, as condições das outras não precisam ser atendidas.

Para mudarmos isso devemos digitar esse comando em todas elas, OU simplesmente trocar na última por WITH CASCADED CHECK OPTION.
