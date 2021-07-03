# Conheça a ferramenta pgAdmin

_**Aula ministrada por Daniel Costa**_
_**Anotações por Paulo Henrique Leme**_

## Problemas de acesso

Importante:

* Liberar acesso ao cluster em postgresql.conf

* Liberar acesso ao cluster para o usuário do banco de dados em pg_hba.conf

* Criar e editar os usuários

### Liberando acesso

Vamos achar o campo `listen_addresses` para editar com o nosso IP:

```
#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------

# - Connection Settings -

listen_addresses = 'localhost'		# what IP address(es) to listen on;
```

Se tivermos um asterisco na frente do `listen_addresses`, vamos tirar, e APENAS NO AMBIENTE DE TESTE podemos colocar um asterisco (*) no lugar de `localhost`. No dia a dia, sempre coloque o IP autorizado

