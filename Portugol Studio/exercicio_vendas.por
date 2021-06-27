programa
{
	
	funcao inicio()
	{
		real jan, fev, mar, abr, soma, media

		escreva("Insira o valor das vendas do mês de Janeiro:")
		leia(jan)
		escreva("Insira o valor das vendas do mês de Fevereiro:")
		leia(fev)
		escreva("Insira o valor das vendas do mês de Março:")
		leia(mar)
		escreva("Insira o valor das vendas do mês de Abril:")
		leia(abr)

		soma = jan+fev+mar+abr
		media = soma/4

		escreva("Você vendeu um total de R$" + soma +
		" nesse quadrimestre, mantendo uma média de R$" +
		media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 0; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */