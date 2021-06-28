# Aula 02 - Navegação Básica no Terminal e Instalação

_aula ministrada por **Professor Gustavo Reis**_
_anotações por **Paulo Henrique Leme**_

## GUI x CLI

GUI(Graphic User Interface) é a interface gráfica que nós normalmente utilizamos de um programa. Ao editarmos uma imagem em um programa de edição, ou mexermos na configuração do nosso software de programação, estamos utilizando uma interface, ou um GUI.

O Git foi feito pensado primariamente para ser utilizado como um CLI(Command Line Interface), que seria uma interface de linhas de comando, ou seja, feito para que nós o utilizemos através de linhas de código.

Existem programas de terceiros que adicionam uma interface gráfica para o Git, mas nesse curso vamos nos focar na forma tradicional, que é a mais utilizada no dia a dia do desenvolvedor.

## O que vamos aprender?

* Mudar de pastas
* Listar as pastas
* Criar pastas/arquivos
* Deletar pastas/arquivos

## Comandos básicos

Existem diferenças básicas entre comandos utilizados de acordo com o sistema operacional da sua máquina, isso porque o Linux e o Windows possuem bases diferentes, e essas bases foram criadas com comandos distintos

Windows | Linux  | Função
:--- | :--- | :---
cd | cd  | Mudar pasta
dir | ls | Listar pastas/arquivos
mkdir | mkdir | Criar pastas
del/rmdir | rm -rf | Apagar pastas
cls | clear | Limpa a tela


## `dir`
O comando `dir` ou `ls` tem a função de mostrar para nós uma lista com todas as pastas e arquivos dentro da pasta (diretório) que estivermos.

Vamos supor que estamos em uma pasta chamada *Imagens*, e nela tenhamos 3 imagens chamadas *Pôr do Sol*, *Nascer do Sol* e *Sem Sol*, além de uma pasta chamada PrintScreen

Caso dermos o comando `dir` dentro dessa pasta, ele vai nos mostrar os três arquivos e a pasta lá dentro, mais ou menos assim:

```
dir

Nascer do Sol.jpg
Por do Sol.jpg
PrintScreen
Sem Sol.png
```

## `cd`

O comando `cd` tem como função nos ajudar a navegar dentro dos arquivos. Ele é uma sigla para **Change Directory**, ou em português, mudar diretório.
Para acessar uma pasta que esteja dentro da pasta que estamos, basta digitar o comando `cd`, seguido do nome da pasta que queremos abrir.

Vamos supor que naquela mesma pasta *Imagens*, tivéssemos uma outra pasta chamada *PrintScreen*, e quiséssemos entrar nela. Faríamos assim:

```
cd printscreen
```

Simples assim! Agora que estamos dentro da pasta *PrintScreen*, podemos dar um comando `dir` para vermos as pastas que existem no sistema e depois utilizar o comando `cd` para entrar na próxima pasta que queremos

Mas e se quisermos voltar uma pasta para trás? Aí basta utilizar o comando `cd` seguido de dois pontos finais`..`, deste jeito:

```
cd ..
```
Se estivéssemos na pasta *PrintScreen* e déssemos o comando `cd ..`, voltaríamos para a pasta *Imagens*!

## `mkdir`

O `mkdir` é um comando que utilizamos para criar outras pastas, outros diretórios. Ele significa *make directory*.

Vamos por exemplo laaaa para a pasta inicial do computador, que normalmente é o *Disco C*. Para isso, vamos usar o comando `cd` que já conhecemos, mas com uma barra `/` na frente. Isso vai fazer com que o computador vá para a pasta inicial do sistema. Depois disso, vamos criar uma pasta nele e dar o nome de *Workspace

```
cd /

mkdir Workspace
```

## Silence on Success

Ao criar a pasta, normalmente o prompt de comando (esse é o nome da temida tela preta) não mostra nada novo. Isso é um excelente sinal. O prompt usa o conceito de *Silence on Success*, ou *Silêncio no Sucesso*. Isso significa que, quando uma operação der certo, normalmente não retorna aviso nenhum. Já se der algum erro, aí sim ele nos retorna um aviso!

Quer comprovar? digite o comando `dir` e veja se a pasta está criada!

## Criando um arquivo pelo terminal

E nem só de diretórios vive um terminal! Nós também somos capazes de criar arquivos dentro dele, e inclusive colocarmos informações nestes arquivos!

Temos um comando no terminal chamado `echo` (eco). Ele serve para exibir na tela qualquer informação que escrevermos depois dele. Ele funciona de forma parecida com um comando `escreva` no Portugol, ou `print` do Java, ou até mesmo o próprio `echo` do PHP. Nada mais é do que um comando para exibir algo.

Então, se digitarmos:

```
echo Hello, World!
```

Ele vai escrever na tela:

```
Hello, World!
```

Agora, algo interessante acontece quando nós utilizamos esse comando com o símbolo de maior `>` e depois dele colocamos o nome de um arquivo. Assim:

```
echo Hello, World! > hello.txt
```

Visualmente, nada aconteceu, mas se você listar o conteúdo da pasta, vai ver que um arquivo de nome `hello.txt` foi criado. E mais! Dentro dele, foi gravado o texto `Hello, World!`.

Isso acontece porque o sinal de maior `>` funciona como um redirecionador de fluxo, isto é, ao invés de exibir a mensagem no prompt, ele redirecionou a mensagem para dentro do arquivo. E como o arquivo não existia, ele foi criado para nós!

## Deletando arquivos e pastas

Cansamos da pasta Workspace! Não queremos mais ela! Simbora deletar?

Para deletar temos dois comandos diferentes, o `del` e o `rmdir`. O comando `del` apaga somente os arquivos dentro de uma pasta, mas mantém a pasta no local. Então se estivermos no *Disco C* e passarmos `del workspace` ele vai apagar apenas o documento `hello.txt` que existe lá dentro. E não é isso que queremos.

Vamos então para o *Disco C* e lá vamos utilizar o comando

```
rmdir workspace
```

Pronto! Agora se listarmos as pastas, o Workspace não existe mais!

## Diferenças no Linux / OSX

Lembra da tabela lá de cima? Os comandos do sistema Windows são diferentes dos comandos para Linux e OSX (Apple).

Vale dizer que o funcionamento é muito similar entre eles, mas ao invés de utilizar o `dir`, por exemplo, no Linux vamos utilizar o `ls`.

A diferença maior está no comando para deletar arquivos e diretórios.

Nos sistemas Linux e OSX, nós vamos utilizar o comando `rm`, de *remove*, e vamos passar dois parâmetros especiais para eles que são `-rf`. O hífen `-` serve para mostrar que vamos passar esses parâmetros, o `r` serve para dizer que é recursivo, ou em outras palavras, que ele vai apagar a pasta e todo o conteúdo que está dentro dela, e o `f` é de forçadamente, ou seja, não precisa pedir confirmação, pode ir em frente e deletar.
