# Conheça o DML e o Truncate

_**Aula ministrada por Daniel Costa**_

_**Anotações por Paulo Henrique Leme**_

## Revisão

Na aula passada, abordamos sobre:

* PK
* FK
* Tipos de dados
* DDL
* DML

## Idempotência

Propriedade que algumas ações e operações possuem possibilitando-as de serem executadas diversas vezes sem alterar o resultado após a aplicação inicial.

No momento de criação de tabelas, por exemplo se colocarmos o comando IF EXISTS ou IF NOT EXISTS, evitamos diversos erros apenas adicionando a propriedade Idempotência através deles!

Temos truques de Idempotência tanto pra DDL quando para DML.

## Melhores práticas em DDL

Importante as tabelas possuírem campos que realmente serão utilizados e que sirvam de atributo direto a um objetivo em comum.

* Criar/Acrescentar colunas que são "atributos básicos" do objeto, que seja algo realmente comum a todos os objetos do tipo pertinente a tabela. Como por exemplo `tabela CLIENTE: coluna TELEFONE/coluna AGENCIA_BANCARIA`

* Cuidado com regras (constraints)

* Cuidado com o excesso de FKs

* Cuidado com o tamanho indevido de colunas. Exemplo: `coluna CEP VARCHAR (255)`

## DML - CRUD

### Estrutura SELECT:

```
SELECT (campos,)
FROM tabela
[condições]
```

Exemplos:

```
SELECT numero, nome FROM banco;
SELECT numero, nome FROM banco WHERE ativo IS TRUE;
SELECT nome FROM banco WHERE email LIKE '%gmail.com';

SELECT numero FROM agencia
WHERE banco_numero IN (SELECT numero FROM banco WHERE nome ILIKE '%bradesco%')
```

* IS TRUE: retorna se o campo ativo for verdadeiro

* LIKE %: Vai pesquisar toda a coluna, substituindo o sinal % por qualquer caractere

* ILIKE %: Igual ao like, mas diferencia maiúsculas e minúsculas

* IN (): Faz um "select dentro de um select". As vezes pode ser feito, mas se possível deve ser evitado, pois consome recursos de forma não eficiente

### Condições no SELECT (WHERE)

O WHERE é uma espécie de "estrutura condicional" do banco de dados, onde o SELECT só vai nos retornar o campo caso ele atenda a condição. Para isso, podemos utilizar operadores condicionais, bem como já vimos em lógica de programação

* =
* \>
* \>=
* <\> ou !=
* LIKE
* ILIKE
* IN
* IS TRUE
* IS FALSE

E podemos também utilizar os operadores lógicos AND ou OR, para adicionar novas condições

### SELECT com Idenpotência

```
SELECT (campos,)
FROM tabela1
WHERE EXISTIS(
    SELECT (campo,)
    FROM tabela2
    WHERE campo1 = valor1
    [AND/OR campoN = valorN]
);
```

Não é uma boa prática. Melhor usar o LEFT JOIN.

### Evitar SELECT *

Muitas vezes precisamos de um único campo da tabela, mas damos o comando SELECT * pela conveniência. Acontece que ao solicitarmos ao retorno de todos os campos, pedimos mais dados, o que consome tráfego da rede de internet, da rede do servidor, da memória, etc.

Ao utilizar isso em testes ou durante o aprendizado podemos não notar o quanto isso pode ser nocivo. Mas se temos um site com vários acessos, esse consumo de memória pode travar ele, derrubar ele. Ou então esse excesso de dados que o SELECT trás deixa o site mais lento, o que te penaliza nas pesquisas do Google, e consequentemente no retorno das visualizações do seu site. E muitos outros problemas, que um detalhe pode acabar causando.

## INSERT

INSERT (campos da tabela,) VALUES (valores,);
INSERT (campos da tabela,) SELECT (valores,);

```
INSERT INTO agencia(banco_numero,numero,nome) VALUES (341,1,'Centro da cidade');
```

### INSERT com Idempotência

```
INSERT INTO agencia(banco_numero,numero,nome) VALUES (341,1,'Centro da cidade')
ON CONFLICT (banco_numero, numero) DO NOTHING;
```

O comando ON CONFLICT serve para dizer que, se já houver esses dados na tabela, o computador não precisa fazer nada, evitando assim o retorno de um erro.

## UPDATE

```
UPDATE (tabela) SET campo1 = novo_valor WHERE (condição);
```

## DELETE

Também lembrar sempre de adicionar uma condição para não deletar a tabela toda

### TRUNCATE

O TRUNCATE esvazia toda a tabela

```
TRUNCATE [TABLE][ONLY] name [*][,...]
    [RESTART IDENTITY, CONTINUE IDENTITY] [CASCADE, RESTRICT]
```
* Restart Identity: Você reinicia a contagem de um número serial, com auto incremento. Assim as ids antigas serão reutilizadas
* Continue Identity: Essa é a opção padrão, que continua de onde os dados anteriores pararam, mesmo que você os tenha excluído. Assim as ids antigas não serão reutilizadas

* Cascade: Vai apagar toda a tabela, apagando também as referências em outras tabelas. Por exemplo: Se você apagar um cliente que tenha ligação a pedidos que estão em outra tabela, ele também vai apagar esses pedidos
* Restrict: Apaga apenas o que está na tabela, sem afetar as demais. Se você apagar um cliente que tenha ligação a pedidos que estão em outra tabela, ele não vai apagar esses pedidos
