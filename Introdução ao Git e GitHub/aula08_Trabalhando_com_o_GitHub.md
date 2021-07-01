# Aula 08 - Trabalhando com o GitHub

_aula ministrada por **Professor Gustavo Reis**_

_anotações por **Paulo Henrique Leme**_

## Primeiro Acesso

O GitHub é um site que nos permite armazenar os nossos projetos de forma remota, oferecendo um servidor para hospedarmos os nossos repositórios, ao mesmo tempo que também permite que compartilhemos nosso código com desenvolvedores do mundo todo, recebendo e oferecendo ajuda da melhor forma que a comunidade dev conhece, colaborativamente!

No primeiro acesso ao [GitHub](https://github.com/) você vai fazer um cadastro normalmente. O seu login com email e username não precisam ser os mesmo do cadastro do Git, mas caso o faça, facilitará na hora de identificar o autor do projeto como sendo você mesmo, já que as vezes teremos que fazer alterações pontuais no arquivo dentro do GitHub

Se utilizarmos o comando `git --list` no prompt, vai ter uma lista das configurações do Git, incluindo seu email e nome de usuário(nickname).

## Alterando usuário no Git

Caso você precise, pode alterar o nome ou o email do Git para igualar ao cadastro que você já possui no GitHub.

Para isso, primeiro vamos tirar o nickname:

```
git config --global --unset --user.name
```

Agora que você usou o `--unset`, o nickname está em branco. Vamos adicionar ele novamente com o comando:

```
git config --global --user.name Paulo
```

Pronto! Desse jeito, você corrigiu seu nome de usuário!

Se precisar fazer isso com o email, o processo é o mesmo, trocando apenas o comando `user.name` por `user.email`.

## Seu painel GitHub

Além de ser um servidor para guardar seu repositório, o GitHub também atua como uma rede social de desenvolvedores! Nele nós podemos compartilhar códigos, seguir outros desenvolvedores, trocar mensagens e colaborar com projetos!

Explore a plataforma, ela tem muitos projetos interessantes!

## Criando um novo repositório no servidor GitHub

No canto superior direito temos um campo de opções, abra ele e clique em "Your Repositories" (seus repositórios). Na nova página que vai abrir, temos um botãozinho verde escrito "New". Clique nele para criar o repositório onde vamos armazenar nosso livro de receitas.

Coloque um nome para o repositório, uma descrição, deixe público, para o mundo ver o seu livro. Como já criamos um arquivo README, vamos deixar a opção de criar esse arquivo automaticamente como desmarcada, e por fim, vamos clicar em "Create Repository" para criarmos!

Na página seguinte, o próprio GitHub já nos dá algumas instruções de como prosseguir para adicionarmos o nosso repositório local para o repositório que acabamos de criar.

Perceba que ele nos dá um URL (um link) com o caminho do repositório dentro do site do GitHub. Nós vamos copiá-lo, para podermos utilizar ele e transferir aquele repositório da nossa máquina para o servidor.

## Colocando nossa receita nas nuvens!

Agora, nós vamos lá na nossa pasta `livro-receitas` e vamos abrir o prompt do Git Bash lá. Lembra como faz? Clicamos com o botão direito dentro da pasta e clicamos na opção *Git Bash here*.

Agora nós vamos dizer para o Git qual é o endereço do nosso repositório remoto, que nada mais é do que aquele link que o GitHub nos deu. Para isso, vamos utilizar o comando:

```
git remote add origin https://github.com/PauloHLeme/livro-receitas.git
```

Isso vai fazer com que o git adicione (add) um caminho remoto (remote) com o nome origin, e coloce como caminho o link que pegamos.

Agora, sempre que precisarmos falar o caminho para ele, ao invés de digitar tooooodo o link, só precisamos falar o nome dele, ou seja, *origin*!

Agora vamos enviar o arquivo pra esse link utilizando o comando `push`, que vem do inglês para *empurrar*. Isso vai fazer com que peguemos nosso repositório local e empurremos para o repositório externo lá no servidor do GitHub.

```
git push origin master
```

Dessa forma nós pedimos para o Git empurrar (push) o nosso repositório para o destino de nome origin (que vai mandar para aquele link que atribuímos ao nome), no ramo de nome master (esse é um conceito novo, que vamos endender melhor daqui a pouco).

### Atenção

>Várias pessoas relataram problemas nessa etapa do processo, com o comando travando e tendo que fechar o terminal. [Clicando neste link](https://web.digitalinnovation.one/topics/trabalhando-com-o-github?tab=forum&topic_type=me&back=%2Ftrack%2Fsantander-fullstack-developer&back_order=newest&back_page=1&page=1&order=oldest) você será direcionado para uma pergunta de um fórum do site Digital Innovation One, onde a usuária [Carolina Dourado](https://web.digitalinnovation.one/users/carolinagomesdourado?tab=achievements) providenciou uma solução simples. Siga as instruções dela e tudo deve funcionar corretamente!

Depois de dar o Push, se tudo der certo, uma mensagem vai aparecer detalhando a quantidade de arquivos carregados, a compressão desses arquivos e o caminho do repositório remoto. Se você entrar agora de novo lá na página do GitHub e atualizar, vai ver a mágica acontecer!

Seus arquivos estarão lá, salvos em segurança, compartilhados com o mundo, e exibindo o arquivo Readme lindo que você criou, parabéns!

## Navegando no GitHub

A parte gráfica do GitHub é bem rica, e explorando vamos encontrar várias funcionalidades bacanas, que em palavras seria bem difícil ilustrar. Por isso, assista a aula junto ao professor com atenção, se possível, divida a tela, abra o vídeo do curso em uma aba e o GitHub na outra, explore junto. Vá aprendendo na prática, coloque a mão na massa! Aprenda fazendo! E o mais importante, explore a plataforma.
