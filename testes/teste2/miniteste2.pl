:-use_module(library(clpfd)).
:-use_module(library(lists)).

%1
%ups_and_downs(+Min,+Max,+N,-L)
ups_and_downs(Min,Max,N,L):-
        once(make_empty_list(N,L)),
        domain(L, Min, Max),
        restricao(L),
        %write(L),
        labeling([],L).

make_empty_list(0,[]).

make_empty_list(N,[_|Vs]):-
        NextN is N - 1,
        make_empty_list(NextN,Vs).

restricao([L1,L2]):-
        L1 #> L2 #\/ L1 #< L2.

%restricao([L1,L2,L3|Ls]):-
%        (L2 #> L1 #/\ L2 #> L3) #\/ (L2 #< L1 #/\ L2 #< L3),
%        restricao([L2,L3|Ls]).

restricao([L1,L2,L3|Ls]):-
        L2 #> L1,
        L2 #> L3,
        restricao([L2,L3|Ls]).

restricao([L1,L2,L3|Ls]):-
        L2 #< L1,
        L2 #< L3,
        restricao([L2,L3|Ls]).

%2
concelho(x,120,410).
concelho(y,10,800).
concelho(z,543,2387).
concelho(w,3,38).
concelho(k,234,376).

%concelhos(+NDias,+MaxDist,-ConcelhosVisitados,-DistTotal,-TotalEleitores)
concelhos(NDias,MaxDist,ConcelhosVisitados,DistTotal,TotalEleitores):-
        once(findall([N,D,E],concelho(N,D,E),ConcelhosList)),
        once(length(ConcelhosList, NConcelhos)),
        once(make_empty_list(NDias,List)),
        domain(List, 1, NConcelhos),
        %all_distinct(List),
        splitList(ConcelhosList, List, ConcelhosVisitados, DistList, EleitList),
        sum(DistList,#=,DistTotal),
        DistTotal #=< MaxDist,
        write(EleitList),
        sum(List,#=,TotalEleitores),
        labeling([maximize(TotalEleitores)],List).


splitList(_, [], [], [], []).

splitList(ConcelhosList, [L1|Ls], [N1|Ns], [D1|Ds], [E1|Es]):-
        nth1(L1, ConcelhosList, [N1,D1,E1]),
splitList(ConcelhosList, Ls, Ns, Ds, Es).

%mynth1(1, [E|_], E).
%mynth1(N, [_|Xs], E) :-
%        N #> 1,
%        N #= N1 + 1,
%        mynth1(N1, Xs, E).

%3
%change(+Coefs,+CashRegister,+Payment,+ToPay,-Change)
change(Coefs, CashRegister, Payment, ToPay, Change):-
        once(length(CashRegister, Counter)),
        once(make_empty_list(Counter, Change)),
        once(dominios_change(CashRegister, Change)),
        changes_total(Coefs, Change, ListChangesTotal),
        Difference is Payment - ToPay,
        sum(ListChangesTotal, #=, Difference),
        labeling([],Change).

changes_total([], [], []).

changes_total([A1|As], [B1|Bs], [C1|Cs]):-
        C1 #= A1 * B1,
        changes_total(As, Bs, Cs).
        

dominios_change([], []).

dominios_change([A1|As], [B1|Bs]):-
        B1 in 0 .. A1,
        dominios_change(As, Bs).

%4
%availablechange(+Coefs,+CashRegister,+Pocket,-ToPay)
availablechange(Coefs, CashRegister, Pocket, ToPay):-
        once(length(Pocket, Counter)),
        once(make_empty_list(Counter, L)),
        once(dominios_change(Pocket, L)),
        %once(money_total(Coefs, Pocket, MaxMoney)),
        changes_total(Coefs, L, ListChangesTotal),
        sum(ListChangesTotal, #=, Payment),
        Payment #> 0,
        labeling([],L),
        ToPay in 1 .. Payment,
        labeling([],[ToPay]),
        change(Coefs, CashRegister, Payment, ToPay, _).

%money_total(Coefs, Pocket, Max):-
        %money_total_aux(Coefs, Pocket, TmpList),
        %sumlist(TmpList,Max).

%money_total_aux([], [], []).

%money_total_aux([A1|As], [B1|Bs], [C1|Cs]):-
        %C1 is A1 * B1,
        %money_total_aux(As, Bs, Cs).

%5
%clouduse(+CloudServiceLimits,+Contents,-CloudUse)
clouduse(CloudServiceLimits,Contents,CloudUse):-
        once(length(CloudServiceLimits, CSLCounter)),
        once(length(Contents, CCounter)),
        once(make_empty_list(CCounter, CloudUse)),
        once(domain(CloudUse,1,CSLCounter)),
        calculate_usage(CloudUse, Contents, CloudUsage, 1, CSLCounter),
        limit_usage(CloudServiceLimits, CloudUsage),
        used_clouds(CloudUse,1,CSLCounter,UsedClouds),
        sum(UsedClouds,#=,NCloudsUsed),
        labeling([minimize(NCloudsUsed)],CloudUse).

calculate_usage(_,_,[], Counter, CSLCounter):-
        Counter > CSLCounter.

calculate_usage(CloudUse,Contents,[C1|Cs], Counter, CSLCounter):-
        Counter =< CSLCounter,
        get_sublist(Counter, CloudUse, Contents, TmpList),
        sum(TmpList,#=,C1),
        NextCounter is Counter + 1,
        calculate_usage(CloudUse,Contents,Cs, NextCounter, CSLCounter).

get_sublist(_, [], [], []).

get_sublist(Counter, [C1|C1s], [C2|C2s], [C2|Ts]):-
        C1 #= Counter,
        get_sublist(Counter, C1s, C2s, Ts).


get_sublist(Counter, [C1|C1s], [_|C2s], TmpList):-
        C1 #\= Counter,
        get_sublist(Counter, C1s, C2s, TmpList).

limit_usage([], []).

limit_usage([C1|C1s], [C2|C2s]):-
        C2 #=< C1,
        limit_usage(C1s, C2s).
                
used_clouds(_,Counter,CSLCounter,[]):-
        Counter > CSLCounter.

used_clouds(CloudUse,Counter,CSLCounter,[C1|Cs]):-
        Counter =< CSLCounter,
        count(Counter,CloudUse,#=,0),
        C1 #= 0,
        NextCounter is Counter + 1,
        used_clouds(CloudUse, NextCounter, CSLCounter, Cs).

used_clouds(CloudUse,Counter,CSLCounter,[C1|Cs]):-
        Counter =< CSLCounter,
        count(Counter,CloudUse,#>,0),
        C1 #= 1,
        NextCounter is Counter + 1,
        used_clouds(CloudUse, NextCounter, CSLCounter, Cs).