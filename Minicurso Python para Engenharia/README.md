###Minicurso Pyton para Engenharia - 2023
####Ministrado no IFTO - Campus Palmas durante a V Semana Acadêmica de Engenharia Elétrica



**Conteúdo Programático**

- Por que Python ?
- Linguagem compilada vs. Linguagem interpretada
- Sintaxe e identação
- Palavras chave
- Comandos básicos
- Tipos de dados e tipos numéricos 
- Tipagem dinâmica
- Controle de fluxo [if....else, for, for...else, while, pass, switch]
- Operadores lógicos e de expressão
	- or, and, not, |, &, ^^, >=, <=, == 
- Matemática computacional - Scipy / Numpy
	- Numéros Complexos e sistemas de coordenadas
	- *Calculadora que converte polar <-> cartesiano*
- Arrays e matrizes [indexação e operações] 
	- *Calculadora para fazer cálculos com polar e cartesiano*
- Biblioteca Symbolic - Integral e derivada
	- *Calculadora de integrais, derivadas e derivadas parciais*
- Somatório e limite
- Gráficos básicos - Matplotlib [comentar sobre Seaborn]
	- *Plotar saída de uma função integral ou uma derivada/tangente*

*Desafio: montar método numérico de Gauss, para funções de uma variável*


## Porque Python ?

Crescente uso nas últimas décadas, mas porque?

Qualidade no software: Python além de ser relativamente mais simples para aprender do que outras linguagens de scripts tradicionais, possui um código projetado para ser legível e de fácil manutenção, oferencendo um excelente suporte para mecanismos de reutilização de código e portabilidade.

Produtividade: Naturalmente o código me Python tem, geralmente, cerca de 1/3 a 1/5 do código equivalente em C++ ou Java, o que significa menos digitação, menos depuração e menos manutenção, além de ter o código executado diretamente (independente da plataforma), sem a necessidade de compilação ou vinculação com outras ferramentas.

Bibliotecas e suporte da comunidade: Como uma coisa leva a outra, o fato de ser uma linguagem muito utilizada faz com que novas bibliotecas e melhorias apareçam de forma mais dinâmica. Suas funcionalidades e inovações são geridas por um Style Guide for Python Code, ou carinhosamente conhecido como PEP 8.

Integração de componentes: Atualmente o código Python pode chamar bibliotecas C++, C e integrado com componentes Java ou JavaScript, além de poder se comunicar diretamente por meio de interações pela rede, onde a maior parte do serviço já vem pré compilada e portátil.



## Tipos de dados e tipos numéricos 

Números [int, float, double]
String
Listas
Dicionários
Tuplas
Arquivos




## Operadores lógicos e de expressão

**Operadores lógicos:**
	and, or, not

**Operadores algébricos:**
	+  adição
	-   subtração
	*   multiplicação
	/   divisão
	//  divisão (arrendondada para menos)
	%  resto da divisão
	**   exponencial

**Operadores relacionais**
	<     menor que
	>     maior que
	<=  menor ou igual
	>=  maior ou igual
	==  igualdade
	!=    desigualdade

**Operadores de atribuição**
	=    atribuição
	+= atribuição com soma
	-= atribuição com subtração
	* = atribuição com multiplicação
	/= atribuição com divisão
	


## Comandos básicos e controle de fluxo


Os comandos básicos são:
	print e input, fazendo assim entrada e saida dos dados
	*implementar uma calculadora c/ as 4 op. básicas*

#### Controle de fluxo:

**if / else**

	if (condição_1):
		print("Ação X")
		#codigo
		#devidamente 
		#identado

	elseif(condição_2):
		print("Ação Y")
		#sempre
		#mantendo
		#a identação

	else:
		print("Ação Z")
		#o else
		#não é
		#obrigatório

**for**
	> O loop for em Python é utilizado para iterar uma sequência. Sequência é uma interface e qualquer objeto que implemente um determinado conjunto de métodos é considerado uma sequência.

	for a in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]:
		print(a)

	 for i in range(inicio, fim, passo):
	 print(i)
	if(condição):
		continue # pula diretamente para próxima iteração

	for i in range(10) # o mesmo que range(0,10,1) inicio_default=0 e passo_default=1
	print(i)
	break   # interrompe o laço

**for / else**
	> Em Python é possível específicar um bloco else para a estrutura for. Este bloco só será executado se a lista for percorrida até o final, ou seja, se não ocorrer um break.

	for x in [1, 3, 5, 7, 9, 10, 11, 13]:
		if x % 2 == 0:
			print('Tem um número par na lista!')
			break
	
	else: 6 print('Não há número par na lista!'

**while**
	> O loop while em python é bem parecido com o de outras linguagens. Não há do...while em Python.

	while condition:
		do_something

**switch**
	> Não há uma expressão switch no Python, no entanto o mesmo resultado pode ser obtido usando um dicionário.
	
	def str2int(h):
		return('0':0,
					'1':1,
					'2':2,
					'3':3,
					'4':4,
					'5':5,
					'6':6,
					'7':7,
					'8':8,
					'9':9).get(h, None)



## Intro ao Numpy

   **Numpy é uma biblioteca de processamento numérico. O objeto principal da NumPy é o array. Ele é um vetor multidimensional homogênio. É como uma tabela de elementos, todos do mesmo tipo, indexados por um conjunto de inteiros positivos.**

ex 1:
	import numpy as np

	pontos = np.array([[1,0,0], [0,1,1]])

	pontos.shape
	print(len(pontos))
	print(len(pontos[0]))
	pontos.ndim

ex 2:

	import numpy as np

	array_definido = np.array([[1,0],[0,1]])
	matriz_identidade = np.eye(3)
	matriz_de_zero = np.zeros((4,4))
	matriz_de_um = np.ones((5,2))
	nums_aleatorios = np.random.rand(3,4)
	linearmente_espacado = np.linspace(0, 100, 1000, endpoint=True)	

indexação: [continuar da pag 55 do pdf]
