# Aula 05 - Iniciando o Git e Criando um Commit

_aula ministrada por **Professor Gustavo Reis**_

_anotações por **Paulo Henrique Leme**_

## Comandos Iniciais do Git

Nessa primeira aula prática, vamos passar pelos comandos mais básicos do Git, para podermos criar um repositório, adicionar arquivos a ele e fazer nosso primeiro Commit.

Quando estamos usando comandos no prompt, sempre iniciamos com o nome do programa que queremos usar, para depois chamarmos o comando em si. Por isso, todos os comandos que aprenderemos começam com `git`, isso nada mais é que pedirmos para o computador rodar o programa e então executar o comando desejado.

## Iniciando o Git

Quando formos utilizar o Git para gerenciar o nosso projeto, fazer o versionamento dele, devemos ir até a pasta do projeto e inicializar o Git nela. Na prática, isso significa que o Git irá criar uma nova pasta dentro do nosso projeto, com todos os componentes que ele necessita para fazer esse controle. Vamos aprender como fazer isso pelo nosso terminal?

Primeiramente, nós iremos abrir a pasta do projeto. Para o nosso exemplo funcionar ao longo do curso, vamos dizer que temos um projeto que queremos gerenciar via Git chamado `livro-receitas`. Essa pasta está guardada dentro do `Disco C`, em uma outra pasta chamada `workspace`.

Então vamos entrar na pasta livro-receitas, clicar com o botão direito e selecionar a opção "Git Bash here". Se você não tiver essa opção no menu que aparece, quer dizer que a instalação do Git não foi feita corretamente. Volte para a segunda aula para rever o processo.

Agora que abrimos o prompt, vamos digitar o seguinte comando:

```
git init
```

Esse comando vai pedir para o computador inicializar o Git nessa pasta e criar o arquivo `.git` dentro dela. Ao final do processo, ele vai nos retornar essa mensagem:

```
Initialized empty Git repository in C:/workspace/livro-receitas/.git/
```

Isso significa que a pasta foi criada e o Git foi inicializado com sucesso. Nós não vamos conseguir ver a pasta se pedirmos a exibição, pois a mesma é instalada como uma pasta oculta do sistema.

## Configurando o Git

Antes de criarmos nosso primeiro Commit com o Git, precisamos fazer uma rápida configuração no programa. Lembra que o Git salva nos Commits o nome do autor do projeto? Então, vamos nos apresentar pra ele!

Primeiramente, vamos adicionar um email. Para isso, digite o seguinte no terminal:

>É sempre bom lembrar que, ao invés de meuemail@email.com você deve digitar um email seu. Com certeza você sabia disso, mas... vai que, né?

```
git config --global user.email "meuemail@email.com"
```

Com o email adicionado, vamos dizer nosso nome ao Git, afinal, sabemos o nome dele, nada mais justo:

>Ah, e não digite Paulo! Digite o seu nome! A menos que seu nome seja Paulo...

```
git config --global user.name Paulo
```

## Adicionando um Arquivo

Vamos adicionar um arquivo do tipo Markdown no nosso projeto. O arquivo Markdown é parecido com o funcionamento do HTML, aquela tecnologia de criação de páginas da internet, mas tem uma sintaxe (uma escrita) mais simplificada.

Se você está lendo esse documento, ele foi criado todinho com Markdown!

Vamos criar um arquivo de texto na pasta, mas vamos renomear ele para `strogonoff.md`. Ao mudar o `.txt` para `.md`, mudamos automaticamente o tipo do arquivo para Markdown. Após isso, vamos abrir ele para editar.

Você pode editar um arquivo Markdown até mesmo no bom e velho Bloco de Notas, mas também pode utilizar o editor que preferir, seja ele o Typora, o Vim, o Visual Studio Code, etc. Nas aulas, o programa utilizado será o Typora.

>Caso você deseje baixar o Typora, basta [clicar aqui](https://typora.io/).

>O arquivo `strogonoff.md` pode ser acessado [clicando aqui](https://github.com/PauloHLeme/Estudos_Bootcamp_DIO_Santander/blob/master/Introdu%C3%A7%C3%A3o%20ao%20Git%20e%20GitHub/strogonoff.md) e copiado por você, mas recomendo fortemente que estude sobre o Markdown e faça o seu. Ela é uma linguagem de marcação beeeeem fácil de aprender e dá pra você criar páginas bem completas, como essas anotações que você está lendo. Abaixo, deixo duas referências para você conhecer. A primeira é uma referência em inglês, mas bem direta. A segunda, é um material em português muito bem explicado pelo professor Gustavo Guanabara:

[Markdown Reference](https://commonmark.org/help/)

[Manual do Markdown para GitHub - por Gustavo Guanabara](https://github.com/gustavoguanabara/git-github/blob/master/manuais-PDF/guia-markdown.pdf)

## Fazendo nosso primeiro Commit

Agora que criamos o nosso arquivo, o nosso projeto do livro de receitas está começando a tomar forma. Vamos então fazer nosso primeiro Commit para manter nosso projeto salvo e protegido!

Primeiramente, nós vamos no nosso prompt de comando, ainda aberto na pasta livro-receitas (se o seu não está, aproveite para tentar abrir novamente e praticar!), digitar o seguinte comando:

```
git add*
```

Com isso, pedimos para o git preparar todos os arquivos da pasta, adicionando eles no Commit.

Pode acontecer de você receber um aviso ao fazer isso. Não precisa se preocupar com ele, pode seguir em frente. Agora que o Commit está preparado, vamo executá-lo!

```
git commit -m "commit inicial"
```

Aqui temos alguns pontos para observar:

* `git commit` é o comando que utilizamos para mandar fazer o commit

* `-m`: Lembra que o Commit guarda vários dados, entre eles uma mensagem curta sobre o que foi alterado nesse Commit? Esse parâmetro que adicionamos depois do comando é justamente para escrevermos essa mensagem

* `"commit inicial"`: Essa é a mensagem que colocamos para identificar o Commit!

Pronto! O nosso primeiro Commit está feito, e você pode observar no terminal uma mensagem dizendo onde o Commit foi feito (vamos aprender mais a respeito depois), incluindo os caracteres iniciais do famoso SHA1 que identifica o arquivo!
