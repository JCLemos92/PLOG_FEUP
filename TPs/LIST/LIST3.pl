%http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse24

append([],L,L). 
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).