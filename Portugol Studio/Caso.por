programa
{
	
	funcao inicio()
	{
		escreva("1 - Abrir Netflix, 2 - Abrir Amazon Prime, 3 - Abrir HBO GO, 4 - Sair \n")
		inteiro menu = 0
		escreva("Digite sua opção: \n")
		leia(menu)

		escolha(menu){
			caso 1: //testa se valor é igual a 1
			escreva("Abrindo Netflix...")
			pare
			
			caso 2: //testa se valor é igual a 2
			escreva("Abrindo Amazon Prime...")
			pare
			
			caso 3: //testa se valor é igual a 3
			escreva("Abrindo HBO GO...")
			pare

			caso 4: //testa se valor é igual a 4
			escreva("Saindo...")
			
			caso contrario: //caso não seja qualquer outro valor
			escreva("Voce deve escolher entre as opções 1, 2  ou 3.")
		}
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