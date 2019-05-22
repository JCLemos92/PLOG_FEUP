

%given a list, returns a new list, where at index the Element is placed
replaceAtListIndex(List, Index, Element, ResultingList) :-
	Index > 0,
	List = [ListHead | ListTail],
	ResultingList = [ListHead | ResListTail],
	IndexNext is Index - 1,
	replaceAtListIndex(ListTail, IndexNext, Element, ResListTail).
	
replaceAtListIndex(List, Index, Element, ResultingList) :-
	Index = 0,
	List = [ _ListHead | ListTail],
	ResultingList = [ Element | ListTail].
	
getAtomFromNumber(Number, Atom) :-
	number_chars(Number, Y), atom_chars(Atom, Y).

length_list(N, List) :- length(List, N).

generate_matrix(Cols, Rows, Matrix) :-
    length_list(Rows, Matrix),
    maplist(length_list(Cols), Matrix).