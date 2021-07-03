# O que é o arquivo postgre.conf

_**Aula ministrada por Daniel Costa**_
_**Anotações por Paulo Henrique Leme**_

## SO indiferente

Vale dizer que independente do sistema operacional que estivermos usando, os comandos são os mesmos.

## postgresql.conf

Arquivo onde estão definidas e armazenadas todas as configurações do servidor PostgreSQL.

Alguns parâmetros só podem ser alterados com uma reinicialização do banco de dados.

A view `pg_settings`, pode ser acessada por dentro do banco de dados e nos mostra todas as configurações que existem no arquivo `postgresql.conf`.

Acessando a view pg_settings, é possível visualizar todas asconfigurações atuais:

```
SELECT name, setting
FROM pg_settings;
```

Ou é possível usar o comando:

```
SHOW [parâmetro]
```

Por padrão, ele fica armazenado dentro do diretório PGDATA do cluster criado. Com excessão do sistema Ubuntu, ficando nesse caso armazenado dentro de `/etc/postgresql/11(ou a versão instalada)/(cluster)

## Configurações internas

Algumas das mais importantes são:

* LISTEN_ADDRESSES: Endereços TCP/IIP das interfaces que o servidor PostgreSQL vai escutar/liberar conexões.

* PORT: A porta TCP que o servidor PostgreSQL vai ouvir. Por padrão é a 5432

* MAX_CONNECTIONS: Número máximo de conexões simultâneas no servidor PostgreSQL

* SUPERUSER_RESERVED_CONNECTIONS: Número de conexões (slots) reservadas para conexões ao banco de dados de super usuários.

* AUTHENTICATION_TIMEUOT: Tempo máximo em segundos para o cliente conseguir uma conexão com o servidor

* PASSWORD_ENCRYPTION: Qual o algoritmo de criptografia das senhas dos novos usuárioscriados no banco de dados.

* SSL: Habilita a conexão criptografada por SSL (Somente se o Postgre foi compilado com superte SSL)

### Configurações de memória

* SHARED_BUFFERS: Tamanho da memória compartilhada do servidor PostgreSQL para cache/bugger de tabelas, índices e demais relações (Recomendação de 25% do valor da sua memória, mas com cautela para não ter memória demais ou de menos)

* WORK_MEM: Tamanho da memória para operações de agrupamento e ordenação (ORDER BY, DISTINCT, MERGE JOINS)

* MAINTENANCE_WORK_MEM: Tamanho da memória para operações administrativas como VACUUM, INDEX, ALTER TABLE

## Arquivo pg_hba.conf

Responsável pelo controle de autenticação dos usuários no servidor PostgreSQL.

Através desse arquivo, podemos definir quem tem acesso ao quê dentro do banco de dados. Assim podemos ter vários usuários, mas cada um com um tipo diferente de acesso.

### Métodos de autenticação

* TRUST (conexão sem requisição de senha)
* REJECT (rejeitar conexões)
* MD5 (criptografia md5)
* PASSWORD (senha semp criptografia)
* GSS(generic security service application program interface)
...

## Arquivo pgident.conf

Arquivo responsável por mapear os usuários do sistema operacional com os usuários do banco de dados.

Localizado no diretório PGDATA.

A opção ident deve ser utilizada no arquivo pg_hba.conf, montando a relação entre o nome do usuário da máquina e o nome do usuário no banco de dados.

## Comandos administrativos

São os comandos utilizados para a administração do banco de dados, como ligar, desligar, reiniciar, ...

### Ubuntu

* pg_lsculsters: Lista todos os clusters PostgreSQL

* pg_createcluster (version) (cluster name): Cria um novo cluster

* pg_dropcluster (version) (cluster): Deleta o Cluster

* pg_ctlcluster (version) (cluster) (action)? Start, stop, status, restart cluster

### CentOS

* systemctl (action) (cluster)
    * systemctl start postgresql-11: Inicia o cluster
    * systemctl status postgresql-11: Mostra o status do cluster
    * systemctl stop postgresql-11: Para o cluster
    * systemctl restart postgresql-11: Reinicia o cluster

### Windows

Dentro do menu `services` do Windows teremos o postgres rodando. Clicando com o botão direito nele, teremos todas as opções de comandos administrativos.

### Comandos binários

* createdb
* createuser
* dropdb
* dropuser
* initdb
* pg_ctl
* pg_basebackup
* pg_dump / pg_dumpall (pseudobackup)
* pg_restore
* psql
* reindexdb
* vacuumdb

## Arquitetura / hierarquia

### Cluster

Coleção de Banco de Dados que compartilham as mesmas configurações (arquivos de configuração) do PostgreSQL e do sistema iperacional (porta, listen_addresses, etc).

De certa forma, é como se fosse dizer que é uma instalação a parte do Postgre parar cada Cluster. Podemos ter mais de um Cluster por máquina, cada um rodando por uma porta para acesso e transmissão de dados, por exemplo.

### Banco de dados (database)

Conjunto de schemas com seus objetos/relações (tabelas, funções, views)

### Schema

Conjunto de objetos/relações (tabelas, funções, views, etc).

>No MySQL o Schema e o database são a mesma coisa. No Postgre, são objetos diferentes.

Por exemplo, podemos ter um Cluster com 5 bancos de dados, cada um deles podendo conter 1 ou mais Schemas, e cada schema podendo ter várias tabelas, funções e views diferetes!


