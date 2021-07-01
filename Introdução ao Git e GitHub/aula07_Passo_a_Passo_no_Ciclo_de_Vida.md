# Aula 07 - Passo a Passo do Ciclo de Vida

_aula ministrada por **Professor Gustavo Reis**_

_anotações por **Paulo Henrique Leme**_

## Repositório

Quando nós utilizamos o comando `git init`, nós preparamos o nosso projeto para ser trabalhado pelo Git. O que estamos fazendo, na verdade, é criarmos um Repositório. Mas o que é um repositório? Calma que vamos falar disso melhor depois, mas de começo, pense nele como um galpão que armazena vários pacotinhos, cada um com uma versão do seu projeto.

## Tracked e Untracked

O Git tem um ciclo de vida para os arquivos do nosso projeto. No decorrer do nosso trabalho com os arquivos, eles assumirão um desses estados:

* Untracked (não rastreado): É quando o Git ainda não tem o conhecimento do arquivo, como por exemplo quando acabamos de criá-lo, e ainda não fizemos o processo de Adicionar ao Git com o comando `git add`.

* Tracked (rastreado): Aqui a gente já adicionou o arquivo no Git. Um arquivo que está em estado Tracked estará em um dos três sub-estados dele, que são: Unmodified (não modificado), Modified (modificado) ou Staged (apresentado).

Vamos entender um pouco mais de cada um dos estados logo abaixo, mas antes, observem essa imagem que retrata os diversos estados e a transição que acontece em cada um deles. Se você não entender de começo, não se preocupe, vamos abordar com calma. Por hora, apenas lembre que: *Untracked* são aqueles arquivos que ainda não adicionamos ao Git, e *Tracked* são aqueles que já foram adicionados!

![Estágios de um arquivo Git](https://www.git-scm.com/book/en/v2/images/lifecycle.png)

### Staged

Lembra no nosso exercício de exemplo, quando a gente criou a nossa receita de Strogonoff? Então, antes de realizarmos o Commit para "armazenar" nosso projeto no Git, nós tivemos que dar o comando `git add`, certo?

Antes de executarmos o Git Add, o arquivo `strogonoff.md` estava no estado Untracked, pois o Git não tinha conhecimento dele. Ao darmos o comando, o que a gente fez foi dizer para o Git que esse arquivo existia. O Git ainda não tinha ele armazenado em nenhum Commit, mas agora o Git sabia da existência desse arquivo.

O que a gente fez então, não foi nada além de *apresentar* o `strogonoff.md` para o Git. Se a gente apresentou o arquivo, a gente transformou ele em um arquivo **Staged**. O arquivo deixou de ser Untracked e passou a ser Tracked, pois agora ele estava rastreado. E está Staged porque ele foi apresentado, mas ainda não foi armazenado. Deu pra pegar a ideia?

Se olharmos na imagem, tem uma seta que leva direto do Untracked para o Staged. Essa seta representa justamente o que acontece quando adicionamos um arquivo com o comando `git add`.

### Unmodified

Mas beleza, agora que já fizemos a nossa receita de strogonoff, finalizamos o documento, apresentamos ele pro Git, o que estamos esperando? Vamos armazená-lo!
Lembram do famoso `git commit`, que é quando de fato criamos um objeto no Git armazenando todas as informações dos arquivos e pastas, que ficam armazenados em blobs e trees? Todas essas palavras novas e estranhas?

Fazer o Commit nada mais é que, de uma maneira simples, dizer que estamos gravando uma versão do nosso projeto! É como se pegássemos ele, colocássemos em um pacotinho, amarrássemos e entregássemos para o Git guardar com todo cuidado, pra caso uma hora a gente precise dessa versão.

Logo após fazermos o Commit, os arquivos dentro do nosso repositório vão estar salvos do mesmo jeito que estão ali, nas pastas do seu computador, *sem modificação* nenhuma. Tudo o que está nesse novo commit está então, no estado **Unmodified**. O SHA1 que representa o arquivo dentro do Git bate com o SHA1 do arquivo da máquina, porque tá tudo lá, igualzinho, vírgula por vírgula, ponto por ponto, espaço por espaço.

### Modified

Agora, vamos supor que você queira adicionar ao arquivo `strogonoff.md` o tempo de preparo da receita. Você vai lá no computador, abre o seu arquivo e edita ele.

Lembra que o código SHA1 é feito baseado no conteúdo? Isso quer dizer que no momento que você fizer qualquer alteração no seu arquivo, (que o Git já conhece, então ele continua sendo um arquivo do tipo Tracked), ele vai ter o seu código diferente. Isso já é o suficiente para o Git saber que o arquivo foi *modificado*, ele já está diferente do armazenado no galpão do repositório, no pacotinho do Commit. Por isso, ele não é mais um arquivo Unmodified, mas passa a ser um arquivo **Modified**.

Isso é, até você terminar a *modificação*, dar um `git add` e *apresentar* a nova versão, e então commitar um novo pacotinho, pro git ter tudo certinho, onde todos os arquivos estarão *não modificados*. Dá pra perceber o ciclo?

Por isso na imagem temos:

* Uma seta *Add the file*, representando o momento que adicionamos um arquivo e tornamos ele de Untracked para Staged;

* Uma seta *Edit the file*, representando a mudança de Unmodified para Modified toda vez que editamos um arquivo que já está no repositório;

* Uma seta *Stage the file*, que vai de Modified para Staged, representando o momento que apresentamos a modificação para o Git;

* Uma seta *Commit*, representando o momento que criamos esse novo pacote e entregamos para o Git, que vai ficar com todos os arquivos sem alterações, isso é, Unmodified; e

* Uma sta *Remove the file*, representando o que acontece se deletarmos um arquivo do nosso repositório, onde ele estava lá, paradinho Unmodified, e vai embora, se tornando Untracked, pois não é mais rastreado pelo Git.

## Ambiente de Desenvolvimento

Quando estamos desenvolvendo um projeto e utilizando o Git para fazer o versionamento deste projeto, nós podemos dizer que temos 3 ambientes que estão tendo alterações. Esses três ambientes formam o nosso ambiente de desenvolvimento, e trabalham juntos para manterem a organização de todo o nosso projeto:

* Working Directory (diretório de trabalho): São as nossas pastas e nossos arquivos do computador. Quando criamos um novo arquivo, uma nova pasta, ou alteramos um arquivo, estamos mexendo diretamente no que está armazenado na memória da nossa máquina, e não no repositório.

* Staging Area (área de apresentação): É onde nos adicionamos os arquivos novos e as alterações para prepará-los para enviar para o repositório. É aqui que apresentamos para o Git as diferenças do arquivo editado para o Commit anterior.

* Local Repository (Repositório local): Aqui é onde ficam armazenados os Commits, os nossos pacotes contendo as versões do arquivo que foram armazenadas pelo Git.

Durante o processo do desenvolvimento, os arquivos ficam transitando por essas três áreas, conforme criamos, editamos, adicionamos, commitamos, etc.

Existe ainda um quarto ambiente, que seria o Repositório Remoto. Mas sobre ele, vamos aprender quando entrarmos no assunto do GitHub!

## Hora de praticar

Partiu trabalhar no nosso livro de receitas?

se utilizarmos o comando `git status` e dermos Enter, vamos ver que o Git vai nos retornar algumas informações úteis sobre a situação dos nossos arquivos. Nesse momento, a mensagem que deve aparecer será algo como:

```
git status
On branch master
nothing to commit, working tree clean
```

Basicamente o que ele nos disse é que estamos no nosso *Branch Master* (que vamos entender mais pra frente o que é), que os arquivos estão todos atualizados e que não há commits para serem feitos.

Vamos agora criar uma pasta nova dentro da pasta `livro-receitas` chamada `receitas`. Todas as nossas receitas vão ficar dentro dessa pasta, para melhor organização.

No terminal, a gente vai utilizar o comando `mkdir receitas` dentro da pasta livro receitas, para fazer a criação dessa nova pasta.

Com ela feita, vamos utilizar um novo comando, o `mv`, que serve para *mover* documentos para outros locais.

```
mv strogonoff.md ./receitas
```

Isso vai fazer o strogonoff ir para dentro da pasta! Simples assim!

Agora, se nós chamarmos novamente o comando `git status`, a mensagem muda:

```
git status
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    strogonoff.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        receitas/

no changes added to commit (use "git add" and/or "git commit -a")
```

Opa! Como assim??? Por que ele tá falando que deletou a nossa receita de strogonoff???

Calma! Vamos lembrar do seguinte: No Commit que demos para o Git, o `strogonoff.md` estava lá, agora não está mais. Nós sabemos que mudamos ele para a pasta `receitas`, mas como o Git vai saber, ele mesmo tá falando na terceira linha da mensagem que as mudanças ainda nem estão em staged, ou seja, ele nem conhece a pasta receitas.

Ele sabe que no nosso ambiente de Working Directory (diretório de trabalho) existe essa nova pasta, mas ele desconhece seu conteúdo.

Enquanto não dermos um `git add`, todas as alterações ainda estão exclusivamente na memória do computador, e não no Git, nem mesmo na apresentação.

Então vamos lá, adicionar as alterações, indicando quais os arquivos que foram adicionados:

```
git add strogonoff.md receitas/
```

Depois que adicionamos as modificações, elas pulam para a Staging Area. Agora o git já conhece os arquivos, apesar de ainda não ter commitado um novo pacotinho com as alterações. Tanto que se dermos um git status novamente, a situação já mudou:

```
$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        renamed:    strogonoff.md -> receitas/strogonoff.md
```

Olha aí, agora o Git entendeu que o strogonoff foi parar dentro da outra pasta. Tudo isso só de aprensentar as alterações para ele!

Agora, vamos fazer o nosso Commit com o comando:

```
git commit -m "cria pasta receitas, move arquivo para receitas"
```

E pronto! O Git acabou de criar o novo Commit, o novo pacote com o estado atual do nosso projeto! Tudo o que estava na Staging Area foi transferido para o Local Repository. Ou seja, o Commit criado foi armazenado no nosso repositório, que é o local de armazenamento de todo nosso histórico de Commits!

Inclusive, se dermos um `git status` de novo, a mensagem que aparece será igual a do início, indicando que está tudo em ordem e os arquivos estão todos salvos, rastreados e inalterados. Tudo está Tracked e Unmodified novamente, o estado onde as coisas ficam na mais perfeita ordem!
