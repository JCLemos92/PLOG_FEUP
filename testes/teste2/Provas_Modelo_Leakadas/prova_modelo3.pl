:-use_module(library(clpfd)).
:-use_module(library(lists)).

local_and_global_maxima(NLocalMax,GlobalMax,N,L):-
	length(L,N),
	domain(L,1,GlobalMax),
	
	

	labeling([],L).


%Pergunta 12
