programa
{
	
	funcao inicio()
	{
		cadeia pessoas[][] = {{"João", "São Paulo", "(11) 9999-5241"},{"Maria","Ribeirão Preto", "(16) 9999-8596"},{"Ana","Manaus","(92) 9999-8574"}}
		inteiro contador = 0
		
		faca{
			escreva("Nome: " + pessoas[contador][0] + "; Cidade: " + pessoas[contador][1] + "; Telefone: " + pessoas[contador][2]+ "\n")
			contador++
		}enquanto(contador<3)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 388; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */