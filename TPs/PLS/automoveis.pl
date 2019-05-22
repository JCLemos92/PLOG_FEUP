%12 automóveis
%   12 automóveis estão parados em fila, sabe-se que:
%       -destes carros:
%           -4 amarelos
%           -2 verdes
%           -3 vermelhos
%           -3 Azuis
%        -o 1º e o ultimo são da mesma cor
%        -o 2º e o penúltimo são da mesma cor
%        -o 5º é azul
%        -todos os conjuntos de 3 automoveis consecutivos têm cores distintas
%        -partindo do primeiro automóvel p/o último, é possível vizualizar a sequência 
%         amarelo-verde-vermelho-azul, uma única vez

carros(Lista):-
    length(Lista, 12),
    % 1-y, 2-g, 3-a, 4-b
    domain(Lista,1,4),

    %4 amarelos, 2 verdes, 3 vermelhos, 3 Azuis
    global_cardinality(Lista, [1-4,2-2,3-3,4-3]),

    %o 1º e o ultimo são da mesma cor
    element(1,Lista,X), element(12,Lista,X),

    %o 2º e o penúltimo são da mesma cor
    element(2,Lista,Y), element(11,Lista,Y),

    %o 5º é azul
    element(5,Lista,4),

    %todos os conjuntos de 3 automoveis consecutivos têm cores distintas
    trios(Lista),

    %partindo do primeiro automóvel p/o último, é possível vizualizar a sequência 
    %amarelo-verde-vermelho-azul, uma única vez
    quad(List,LC), sum(LC,#=,1),
    
    labeling([ff], Lista).
    

    
trios([_,_,_]).
trios([A,B,C|R]):- 
    alldistinct([A,B,C]),
    trios([B,C|R]).

quad([_,_,_],[]).
quad([A,B,C,D|R], [V|RV]):-
    A#=1 #/\ B#=2 #/\ C#=3 #/\ D#=4 <=> V,
    C #= V+RC,
    quad([B,C,D|R],RC).