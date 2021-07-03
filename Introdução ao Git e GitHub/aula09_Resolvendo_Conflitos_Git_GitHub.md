# Aula 09 - Como os conflitos acontecem no Git e GitHub e como Resolver

_aula ministrada por **Professor Gustavo Reis**_

_anotações por **Paulo Henrique Leme**_

## Diferentes versões de um mesmo Código

Com o projeto no GitHub, você tem a possibilidade de ter várias pessoas trabalhando nele.

Mesmo que cada pessoa tenha uma divisão de serviços muito bem definida, diversas vezes podem acontecer (e vão acontecer) de duas pessoas editarem uma mesma linha de código.

Nesse caso, quando a pessoa 1 jogar o código parar o GitHub, ele ficará salvo como o Commit mais atual, certo?

Na hora que a pessoa 2 for realizar um push do código dela para o GitHub, ou pegar um Pull (puxar) o código do GitHub para o computador dela, ele percebe que tem uma linha que foi atualizada por uma pessoa e essa mesma linha foi atualizada pela outra. Com isso, ele não vai simplesmente sobrescrever com o termo novo e tirar o antigo, vai que o da pessoa 1 está certo, você vai sobrescrever com o outro? Não! O GitHub é mais esperto que isso! Ele vai nos dar um alerta de conflito!

E por mais que o GitHub seja inteligente o bastante para perceber essas diferenças, ele nunca vai tomar o lugar da gente em uma tarefa importantíssima, resolver o conflito e tomar uma decisão. Dessa forma, ele vai nos apresentar o conflito e nos deixar resolver da melhor forma possível.

