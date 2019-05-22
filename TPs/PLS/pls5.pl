:-use_module(library(clpfd)).
% Fila de Carros
% Temos 3 variaveis: tamanho, posicao e cor.
% Azul-1 Verde-2 Amarelo-3 Preto-4 
cars:-
	length(Color,4),
	length(Size,4),
	domain(Color,1,4),
	domain(Size,1,4),

	% Todos os carros tem cores e tamanhos diferentes
	all_distinct(Color),
	all_distinct(Size),
	element(IndexBlue,Color,1), %estamos a ir buscar o Azul
	element(IndexGreen,Color,2),
	IndexBlue #< IndexGreen,
	IndexBlue #> 1,
	IndexBlue #< 4,
	BeforeBlue #= IndexBlue -1,
	AfterBlue #= IndexBlue +1,

	element(AfterBlue,Size,Lesser),
	element(BeforeBlue,Size,Greater),
	Lesser #< Greater,

	element(IndexGreen,Size,1),

	append(Color,Size,List),
	labeling([],List).

%Outra resolução
fila_de_carros(Vars):-
    Colors = [C1,C2,C3,C4], %cores 
    Sizes = [S1,S2,S3,S4],
    append(Colors, Sizes, Vars),
    domain(Colors, 1, 4), 
    domain(Sizes, 1, 4), 
    Amarelo = 1,
    Verde = 2,
    Azul = 3,
    Preto = 4,
    all_distinct(Colors), all_distinct(Sizes),
    
    element(PosAzul,Color,Azul),
    PosAntesAzul #= PosAzul - 1,
    PosDepoisAzul #= PosAzul + 1,

    element(PosAntesAzul,Sizes, SizeAntesAzul), 
    element(PosDepoisAzul, Sizes, SizeDepoisAzul),
    SizeAntesAzul #<SizeDepoisAzul,

    element(PosVerde,Colors,Verde),
    element(PosVerde,Sizes,1),
    PosVerde #> PosAzul,

    element(PosAmarelo, Color, Amarelo), 
    element(PosPreto, Color, Preto),
    PosPreto #< PosAmarelo,
    
    labeling([ff], Vars).
    
