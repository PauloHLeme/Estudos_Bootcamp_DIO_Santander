# Objetos e comandos do Banco de Dados

_**Aula ministrada por Daniel Costa**_
_**Anotações por Paulo Henrique Leme**_

## Database
É o banco de dados em si. Dentro do database temos schemas e objetos, como tabelas, types, views, funções, entre outros.
Seus schemas e objetos não podem ser compartilhados entre si.
Cada database é separado um do outro compartilhando apenas usuários e configurações do cluster PostgreSQL.

## Schemas
É um grupo de objetos, como tabelas, types, views, funções, entre outros.
É possível relacionar objetos entre diversos schemas.
Por exemplo: schema public e schema curso podem ter tabelas com o mesmo nome (teste, por exemplo, relacionados entre si.)

Toda vez que criamos um database, ele vem com um schema de nome public criado. Esse schema é visível para os usuários com permissão de conexão ao banco de dados.

## Objetos
Sâo as tabelas, views, funções, types, sequences e outros pertencentes ao schema

## Comandos Database

```
CREATE DATABASE name
    [ [ WITH ] [ OWNER [=] user_name ]
           [ TEMPLATE [=] template ]
           [ ENCODING [=] encoding ]
           [ LOCALE [=] locale ]
           [ LC_COLLATE [=] lc_collate ]
           [ LC_CTYPE [=] lc_ctype ]
           [ TABLESPACE [=] tablespace_name ]
           [ ALLOW_CONNECTIONS [=] allowconn ]
           [ CONNECTION LIMIT [=] connlimit ]
           [ IS_TEMPLATE [=] istemplate ] ]
```

```
ALTER DATABASE name RENAME TO new_name
ALTER DATABASE name OWNER TO {new_owner, CURRENT_USER, SESSION_USER}
ALTER DATABASE name SET TABLESPACE new_tablespace
```

```
DROP DATABASE [name]
```

## Comandos Schema

```
CREATE SCHEMA schema_name [AUTHORIZATION role_specification]
```

```
ALTER SCHEMA name RENAME TO new_name
ALTER SCHEMA name OWNER TO {new_owner, CURRENT_USER, SESSION_USER}
```

```
DROP SCHEMA [nome]
```

### Melhores práticas

```
CREATE SCHEMA IF NOT EXISTS schema_name
DROP SCHEMA IF EXISTS
```

## Tabelas, colunas e tipos de dados

Tabela é um conjunto de dados dispostos em colunas e linhas referentes a um objetivo comum, isso é, relacionados a um item específico.


### Exemplo

TABELA = automóvel
COLUNA 1 = tipo(carro, moto, aviao, helicóptero)
COLUNA 2 = ano_fabreicacao(2020,2010,1995)
COLUNA 3 = capacidade_pessoas (1, 2, 350)
COLUNA 4 = fabricante (Honda, Avianca, Yamaha)

#### Tabela Produto

NOME | MARCA | TAMANHO | COR
--- | --- | --- | ---
Camisa | Hering | GG | Branca
Calça | Levis | 46 | Preta

## Chave primária

* Chave primária, Primary Key ou PK

* Um conjunto de 1 ou mais campos que nunca se repetem em uma tabéla e que seus valores garantem a integridade do dado único e a utilização do mesmo como referência para o relacionamento entre demais tabelas.

* Não pode haver duas ocorrências de uma mesma entidade com o mesmo conteúdo na PK

* A PK não pode ser um atributo opcional, ou seja, atributo que aceite nulo

* Os atributos identificadores devem ser o conjunto mínimo que pode identificar cada instância de uma entidade

* Não devem ser usadas chaves externas (Não é obrigatório, isso pode acontecer)

* Não deve conter informação volátil

## Chave estrangeira

Chave estrangeira, Foreign Key, FK

Campo ou conjunto de campos que são fererências de chaves primárias de outras tabelas ou da mesma tabela.
Sua principla função é garantir a integridade referencial entre tabelas.

A FK é a PK de uma outra tabela que é importada para a tabela atual, para trazer a relação entre elas.

## Campo ID

Uma boa prática do mercado atualmente é adicionar um campo ID, que acaba gerando um código único para uma linha e atribuir ele como a PK da sua tabela, caso não haja outro campo passivo de não ser repetido

## Tipos de dados

O PostgreSQL tem inúmeros tipos de dados, numéricos, monetários, binários, geométricos, dados de rede, text search, etc...

Neste curso, abordaremos os tipos:

* [Numeric Types](https://www.postgresql.org/docs/13/datatype-numeric.html)
* [Character Types](https://www.postgresql.org/docs/13/datatype-character.html)
* [Date/Time Types](https://www.postgresql.org/docs/13/datatype-datetime.html)
* [Boolean Types](https://www.postgresql.org/docs/13/datatype-boolean.html)


## DML e DDL

DML significa Data Manipulation Language (Linguagem de Manipulação de Dados) e se refere a todos os comandos que fazem a manipulação dos dados dentro de uma tabela.

INSERT, UPDATE, DELETE E SELECT

Vale dizer que algumas literaturas consideram que o comando SELECT como um DQL, Data Query Language, mas isso varia.

DDL significa Data Definition Language (Linguagem de Definição de Dados) e se refere a todos os comandos que modelam a tabela onde os dados serão inseridos.

CREATE, ALTER, DROP

### Exemplos DDL

>Perceba que como o PK nunca pode ficar vazia, sempre deve ter um valor, não precisamos declarar a condição NOT NULL nela, pois o Postgre já vai definir isso de forma padrão!

```
CREATE DATABASE IF NOT EXISTS dadosbancarios;
ALTER DATABASE dadosbancarios OWNER TO diretoria;
DROP SCHEMA IF EXISTS bancos;


CREATE TABLE IF NOT EXISTS banco(
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR (50) NOT NULL,
    data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
);

ALTER TABLE banco ADD COLUMN tem_poupanca BOOLEAN;

DROP TABLE IF EXISTS banco;
```

### Exemplos INSERT

```
INSERT INTO banco (codigo, nome, data_criacao)
VALUES (100, 'Banco do Brasil', now());

INSERT INTO banco (codigo, nome, data_criacao)
SELECT 100, 'Banco do Brasil, now();
```

### Exemplos UPDATE

>ATENÇÃO: Muito cuidado com os Updates. Se você não colocar uma condição WHERE, a mudança ocorrerá em todos!

```
UPDATE banco SET
codigo = 500
WHERE codigo = 100;

UPDATE banco SET
data_criacao = now()
WHERE data_criacao IS NULL;
```

### Exemplos DELETE

>ATENÇÃO: Muito cuidado com os Deletes. Se você não colocar uma codição WHERE, todos serão deletados!

```
DELETE FROM banco
WHERE codigo = 512;

DELETE FROM banco
WHERE nome = 'Conta Digital';
```

### Exemplos SELECT

>Boas práticas: Evite sempre que puder o SELECT * (selecionar todos), ele consome muita memória pois retorna todos os campos, o que nem sempre necessário

```
SELECT codigo, nome
FROM banco

SELECT codigo, nome
FROM banco
WHERE data_criacao > '2013-10-15 15:00:00';
```

## Boas práticas

Os dois campos abaixo são uma boa prática utilizada no dia a dia do desenvolvimento de bancos de dados. São dois campos que podem ser criados em uma tabela para dizer se o objeto ao qual esse registro está ligado está ativo ou inativo, e o segundo campo serve como guia para sabermos a data de criação do dado.

```
ativo BOOLEAN NOT NULL DEFAULT TRUE,
data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
```

É uma boa prática também separar as tabelas de uma forma bem clara e concisa. Um cliente por exemplo pode ter conta em vários bancos, ou até mais de uma conta por banco. Dessa forma, o cliente pode e deve ser colocado como uma tabela a parte. Dessa forma, depois basta relacionar as tabelas de cliente com a de contas, por exemplo, ao invés de criar uma única tabela com clientes e contas ligados em uma só. Você vai ter mais tabelas no banco de dados, mas no dia a dia, para gerenciar informações, alterar tabelas ou qualquer outra manutenção ou consulta necessária, vai te facilitar muito mais se for feito de forma separada!


## Exercício

Após criarmos as tabelas juntamente com o professor, precisamos adicionar dados a elas! Para isso, basta acessar o link [github.com/drobcosta/digital_innovation_one](https://github.com/drobcosta/digital_innovation_one). Lá teremos os arquivos DDL e DML das aulas de hoje.

O arquivo DDL nada mais é do que a criação das tabelas, da forma que fizemos durante a aula.

O arquivo DML possui milhares de dados para serem inseridos nas tabelas. Mais do que simplesmente copiar e colar os registros, tente ler e entender o que eles são. O que está lá foi explicado na aula de hoje!
