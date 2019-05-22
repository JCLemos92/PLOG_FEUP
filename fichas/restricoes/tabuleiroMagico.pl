:-use_module(library(clpfd)).

% Cubo Magico
% cada celula do tabuleiro vai ser instanciada com uma letra de A...I
magic(Vars):-
	Vars = [A,B,C,D,E,F,G,H,I],
	domain(Vars,1,9),
	all_distinct(Vars),
	A+B+C #= Sum,
	D+E+F #= Sum,
	G+H+I #= Sum,

	A+D+G #= Sum,
	B+E+H #= Sum,
	C+F+I #= Sum,
	A+E+I #= Sum,
	C+E+G #= Sum,
	B #< D,
	A #< G,
	A #< C,

	labeling([],Vars).



%Zebra Puzzle
zebra(Zebra,Agua):-
	Sol = [Nac,Ani,Beb,Cor,Tab],
	Cor = [Vermelho,Amarelo,Azu,Verde,Branca],
	Ani = [Cao,Raposa,Iguana,Cavalo,Zebra],
	Beb = [SumoLar,Cha,Cafe,Leite],
	Nac = [PT,ING,ESP,NOR,UKR],
	Tab = [Marlboro,Chesterfield,Winston,LukyStrike,SG],
	List = [Vermelho,Amarelo,Azu,Verde,Branca,Cao,Raposa,Iguana,Cavalo,Zebra,SumoLar,Cha,Cafe,Leite,PT,ING,ESP,NOR,UKR,Marlboro,Chesterfield,Winston,LukyStrike,SG],
	domain(List,1,5),

	all_different(Nac),
	all_different(Ani),
	all_different(Beb),
	all_different(Cor),
	all_different(Tab),
	ING #= Vermelho,
	ESP #= Cao,
	NOR #= 1,
	Amarelo #= Marlboro,
	abs(Chesterfield-Raposa) #= 1,
	abs(NOR-Azul) #= 1,
	Winston #= Iguana,
	LukyStrike #= SumoLar,
	UKR #= Cha,
	PT #= SG,
	abs(Marlboro-Cavalo) #= 1,
	Verde #= Cafe,
	Verde #= Branco+1,
	Leite #= 3,

	labeling([],List),
	write(Sol),nl.



% Fila de Carros
% Temos 3 variaveis: tamanho, posicao e cor.
% Azul-1 Verde-2 Amarelo-3 Preto-4 
carros:-
	length(Cores,4),
	length(Tamanho,4),
	domain(Cores,1,4),
	domain(Tamanho,1,4),

	% Todos os carros tem cores e tamanhos diferentes
	all_distinct(Cores),
	all_distinct(Tamanho),
	element(IndexAzul,Cores,1), %estamos a ir buscar o Azul
	element(IndexVerde,Cores,2),
	IndexAzul #< IndexVerde,
	IndexAzul #> 1,
	IndexAzul #< 4,
	AzulMenos1 #= IndexAzul -1,
	AzulMais1 #= IndexAzul +1,

	element(AzulMenos1,Tamanho,Menor),
	element(AzulMais1,Tamanho,Maior),
	Menor #< Maior,

	element(IndexVerde,Tamanho,1),

	append(Cores,Tamanho,List),
	labeling([],List).
