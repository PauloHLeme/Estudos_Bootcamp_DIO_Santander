# Como Administrar Usuários no Banco de Dados

_**Aula ministrada por Daniel Costa**_
_**Anotações por Paulo Henrique Leme**_

## Users, Roles e Groups

Nas versões superiores ao PostgreSQL 8.1, Users, Roles e Groups são o mesmo conceito, tem o mesmo efeito e função.

## Administrador

Quando você define uma role como administrador, você concede permissão total a ela, para edição geral das tabelas.

Depois disso, podemos criar roles específicas para atividades específicas, como por exemplo, um Role Professor que pode ler todas as tabelas e escrever em duas delas, e um Role aluno, que pode apenas ler uma das tabelas.

É legal dizer que um Role pode ter outros roles dentro. Como por exemplo criar um Role para o usuário Daniel, que vai pertencer ao Role professor. Nesse caso, o role dele não tem poder especial nenhum, mas como foi inserido dentro do Professor, passa a ter os acessos que o professor tem.

Isso é útil por exemplo para gerenciar funções que cada usuário tem de acordo com o grupo a que pertençam!

## Administrando Users

Podemos utilizar o comando `CREATE ROLE name [[WITH] option [...]]`.

As opções podem ser:

```
SUPERUSER, NOSUPERUSER,
CREATEDB, NOCREATEDB,
CREATEROLE, NOCREATEROLE,
INHERIT, NOINHERIT,
LOGIN, NOLOGIN,
REPLICATION, NOREPLICATION,
BYPASSRLS, NOBYPASSRLS,
CONNECTION LIMIT connlimit,
[ENCRYPTED] PASSWORD 'password', PASSWORD NULL,
VALID UNTIL 'timestamp',
IN ROLE role_name [, ...], (deprecated)
IN GROUP role_name [, ...], (deprecated)
ROLE role_name [, ...],
ADMIN role_name [, ...],
USER role_name [, ...], (deprecated)
SYSID uid (deprecated)
```

### Exemplo

```
CREATE ROLE administradores
CREATEDB
CREATEROLE
INHERIT
NOLOGIN
REPLICATION
BYPASSRLS
CONNECTION LIMIT -1;

CREATE ROLE professores
NOCREATEDB
NOCREATEROLE
INHERIT
NOLOGIN
NOBYPASSRLS
CONNECTION LIMIT 10;

CREATE ROLE alunos
NOCREATEDB
NOCREATEROLE
INHERIT
NOLOGIN
NOBYPASSRLS
CONNECTION LIMIT 90;
```

## Associando roles

Quando uma role assume as permissões de outra role, é necessária a opção INHERIT, senão ela não vai poder acessar nenhuma permissão da role superior.

IN ROLE (passa a pertencer a role informada)
ROLE (a role informada passa a pertencer a nova role)
GRANT [role a ser concedida] TO [role a assumir as permissões] (para quando a role já estiver criada mas você precise associar ela a outra)

### Exemplo

Agora que criamos nosso role Professores, vamos adicionar o User Daniel como um professor:

```
CREATE ROLE daniel LOGIN CONNECTION LIMIT 1 PASSWORD '123' IN ROLE professores;
```

Aqui nós dissemos que vamos criar a função daniel (create role daniel) permitindo que apenas uma pessoa por vez se conecte com o usuário Daniel (login connection limit 1) com a senha 123 (password 123) e que ele pertencerá ao grupo professores (in role professores)!

Se utilizássemos o comando ROLE no lugar do IN ROLE estaríamos dizendo que o Role professores iria pertencer ao Role Daniel, que na prática não faria sentido algum.

Se criássemos a role Daniel com o commando `CREATE ROLE daniel LOGIN CONNECTION LIMIT 1 PASSWORD '123';` e não colocássemos ele em nenhum role, poderíamos colocar posteriormente com o comando `GRANT professores TO daniel`.

## Desassociando Roles

Utilizamos o comando REVOKE [role revogada, role pai] FROM [role que perderá as permissões]

### Exemplo

Se Daniel deixar de ser um professor, podemos remover ele da Role digitando:

```
REVOKE professores FROM daniel;
```

Agora Daniel não é mais um professor e não tem mais o acesso especial ao banco de dados!

## Alterando uma role

Funciona de forma similar a criação da role, mas ao invés de digitarmos CREATE, digitamos ALTER.

Depois disso, podemos utilizar qualquer uma das opções de criação.

```
ALTER ROLE daniel
CREATEDB;
```

Caso fizéssemos essa alteração, por exemplo, Daniel teria permissões para criar novos bancos de dados.

## Excluindo role

Simplesmente iremos digitar `DROP ROLE [role]`.

Dessa forma então, agora que o Daniel não faz mais parte da escola, podemos dar o comando

```
DROP ROLE daniel;
```

E agora ele não tem mais um usuário para acessar o banco de dados. Fácil fácil!

## Administrando acessos (GRANT)

GRANTs são privilégios de acesso aos objetos do banco de dados.

Privilégios

* **tabela**
* coluna
* sequence
* **database**
* domain
* foreign data wrapper
* foreign server
* **function**
* language
* large object
* **schema**
* tablespace
* type

Os itens em negrito serão os abordados no curso

### Database

```
GRANT {{CREATE, CONNECT, TEMPORARY, TEMP}[,...] ALL [PRIVILEGES]}
ON DATABASE database_name[,...]
TO role_specification[,...] [WITH GRANT OPTION]
```

### Schema

```
GRANT {{CREATE, USAGE}[,...] ALL [PRIVILEGES]}
ON SCHEMA schema_name[,...]
TO role_specification[,...] [WITH GRANT OPTION]
```

### Table

```
GRANT {{SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES,TRIGGER}[,...] ALL [PRIVILEGES]}
ON TABLE table_name[,...], ALL TABLES IN SCHEMA schema_name[,...]
TO role_specification[,...] [WITH GRANT OPTION]
```

Da mesma forma, o comando `REVOKE` retira as permissões de uma Role

### Database

```
REVOKE [GRANT OPTION FOR]
{{CREATE, CONNECT, TEMPORARY, TEMP}[,...] ALL [PRIVILEGES]}
ON DATABASE database_name[,...]
FROM {[GROUP] role_name, PUBLIC}[,...]
[CASCADE, RESTRICT]
```

### Schema

```
REVOKE [GRANT OPTION FOR]
{{CREATE, USAGE}[,...] ALL [PRIVILEGES]}
ON SCHEMA schema_name[,...]
FROM {[GROUP] role_name, PUBLIC}[,...]
[CASCADE, RESTRICT]
```

### Table

```
REVOKE [GRANT OPTION FOR]
{{SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES,TRIGGER}[,...] ALL [PRIVILEGES]}
ON TABLE table_name[,...], ALL TABLES IN SCHEMA schema_name[,...]
FROM {[GROUP] role_name, PUBLIC}[,...]
[CASCADE, RESTRICT]
```

De forma simplificada, podemos por exemplo fazer:

```
REVOKE ALL ON ALL TABLES IN SCHEMA auladb FROM daniel;

REVOKE ALL ON SCHEMA auladb FROM daniel;

REVOKE ALL ON DATABASE aula FROM daniel;
```

Algumas vezes você não pode excluir uma Role porque ela possui várias permissões e o database fica dependente dela. Ao executar os três comandos acima e retirar todas as permissões da role, você deve ser capaz de excluí-la com o comando `DROP ROLE` que já aprendemos anteriormente!
