# Funções criadas pelo desenvolvedor

_**Aula ministrada por Daniel Costa**_

_**Anotações por Paulo Henrique Leme**_

## O que são funções

Funções são conjutos de códigos que são executados dentro de uma transação com a finalidade de facilitar a programação e obter o reaproveitamento/reutilização de códigos.

Existem 4 tipos de funções:

* query language functions (funções escritas em SQL)
* procedural language functions (funções escritas em, por exemplo, PL/pgSQL ou PL/py)
* internal functions
* C-language functions

O foco da aula será sobre USER DEFINED FUNCTIONS, que serão as criadas por nós, usuários.

### Linguagens das funções

* SQL
* PL/PGSQL
* PL/PY
* PL/PHP
* PL/RUBY
* PL/Java
* PL/Lua
* ...

Para um conteúdo mais completo, acesse: [www.postgresql.org/docs/13/external-pl.html](https://www.postgresql.org/docs/13/external-pl.html)

## Criação de funções

O comando principal para a criação de funções é o CREATE FUNCTION. Ele é um comando bem robusto, e tem vários atributos diferentes que podemos usar. Para termos uma ideia, basta olharmos para o esquema abaixo que mostra sua estrutura, as sem sustos!

```
CREATE [ OR REPLACE ] FUNCTION
    name ( [ [ argmode ] [ argname ] argtype [ { DEFAULT | = } default_expr ] [, ...] ] )
    [ RETURNS rettype
      | RETURNS TABLE ( column_name column_type [, ...] ) ]
  { LANGUAGE lang_name
    | TRANSFORM { FOR TYPE type_name } [, ... ]
    | WINDOW
    | IMMUTABLE | STABLE | VOLATILE | [ NOT ] LEAKPROOF
    | CALLED ON NULL INPUT | RETURNS NULL ON NULL INPUT | STRICT
    | [ EXTERNAL ] SECURITY INVOKER | [ EXTERNAL ] SECURITY DEFINER
    | PARALLEL { UNSAFE | RESTRICTED | SAFE }
    | COST execution_cost
    | ROWS result_rows
    | SUPPORT support_function
    | SET configuration_parameter { TO value | = value | FROM CURRENT }
    | AS 'definition'
    | AS 'obj_file', 'link_symbol'
  } ...
  ```

### Idempotência

CREATE OR REPLACE FUNCTION[nome da função]

Para que ele funcione, a função precisa ter:

* Mesmo nome
* Mesmo tipo de retorno
* Mesmo número de parâmetros/argumentos

Caso isso não seja respeitado, nos é retornado um erro, e precisaremos então dropar a função e criar novamente

### Returns

* INTEGER
* CHAR/ VARCHAR
* BOOLEAN
* TABLE
* JSON

Além disso, utilizaremos duas linguagens: SQL e PLPGSQL

### Segurança

SECURITY: INVOKER ou DEFINER

Invoker é padrão. Quer dizer que você permite que as funções serão executadas apenas dentro das funções que o usuário pelo qual ele está acessando tem.

Já o Definer libera para que o usuário tenha plenos poderes de SuperUsuário quando executar uma função com esse atributo. Deve ser utilizado com cautela.

### Comportamento

IMMUTABLE: Não permite comandos que alteram o banco de dados e pede retornos que não mudam de estado, mesmo com a alteração da tabela. Um SELECT por exemplo normalmente não cabe aqui, pois dados são alterados em tabelas.

STABLE: Não permite comandos que alteram o banco de dados. Trabalha melhor com SELECTs e algumas variáveis.

VOLATILLE: Aceita qualquer comando e permite mudanças. É o padrão.

### Segurança e boas práticas

CALLED ON NULL INPUT: É o padrão. Se qualquer parâmetro ou argumento for NULL, mesmo assim a função será executada.

RETURNS NULL ON NULL INPUT: Se qualquer um dos parâmetros ou argumentos for NULL, a função vai retornar NULL.

### Recursos

COST: Custo/row em unidades de CPU

ROWS: Número estimado de linhas que será analisada pelo planner

## SQL Functions

>Não é possível utilizar Transações!

```
CREATE OR REPLACE FUNCTION fc_somar (INTEGER, INTEGER)
RETURNS INTEGER
LANGUAGE SQL
AS $$
    SELECT $1 + $2;
$$;
```

Onde $$ marcam o início e o final do código propriamente dito e $1 e $2 são os parâmetros de entrada 1 e 2, respectivamente.
Ou melhor ainda, podemos definir nome para os parâmetros, o que é uma boa prática

```
CREATE OR REPLACE FUNCTION fc_somar (num1 INTEGER,num2 INTEGER)
RETURNS INTEGER
LANGUAGE SQL
AS $$
    SELECT num1 + num2;
$$;
```

```
CREATE OR REPLACE FUNCTION fc_bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS TABLE (numero INTEGER, nome INTEGER)
RETURNS NULL ON NULL INPUT
LANGUAGE SQL
AS $$
    INSERT INTO banco (numero, nome, ativo)
    VALUES (p_numero, p_nome, p_ativo);

    SELECT numero, nome
    FROM banco
    WHERE numero = p_numero;
$$;
```

## PLPGSQL

Já a PLPGSQL permite transações, ou seja, podemos ter Begins definidos, savepoints e rollbacks. Por isso é preferível utilizar essa linguagem

```
CREATE OR REPLACE FUNCTION banco_add (p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURN BOOLEAN
LANGUAGE PLPGSQL
AS $$
DECLARE variavel_id INTEGTER;
BEGIN
    SELECT INTO variavel_id numero FROM banco WHERE nome = p_nome;

    IF variavel_id IS NULL THEN
        INSERT INTO banco (numero, nome, ativo) VALUES (p_numero, p_nome, p_ativo)
    ELSE
        RETURN FALSE;
    END IF;
    SELECT INTO variavel_id numero FROM banco WHERE nome = p_nome;
    IF variavel_id IS NULL THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END; $$;

SELECT banco_add(13, 'Banco Azarado',true);
```

## COALESCE

É um comando que manda retornar o primeiro dado não nulo de uma sequência. É uma boa prática utilizar ele para tratamento de erros.

Por exemplo: Se na função formos somar dois números, mas o usuário só passar 1, a soma vai retornar NULL, ele vai entender o outro valor como nulo. Então, para evitar isso, ao invés de pedir para a função somar as duas variáveis com o comando `$1 + $2`, pedimos para ela somar a variável, ou, caso a variável seja nula, utilizar o valor 0. Para isso, vamos usar o COALESCE e passar `COALESCE ($1,0) + COALESCE ($2, 0)`. Pronto! Se ela ver que a variável é nula, vai passar para o próximo da lista, ou seja, o zero!
