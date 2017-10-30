sudoku(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4) :-
    allnum([A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]),
    
    alldiflist([
    % rows
    [A1, A2, A3, A4],
    [B1, B2, B3, B4],
    [C1, C2, C3, C4],
    [D1, D2, D3, D4],

    % columns
    [A1, B1, C1, D1],
    [A2, B2, C2, D2],
    [A3, B3, C3, D3],
    [A4, B4, C4, D4],

    % blocks
    [A1, A2, B1, B2],
    [A3, A4, B3, B4],
    [C1, C2, D1, D2],
    [C3, C4, D3, D4]]).

num(X) :- between(1, 4, X).

allnum([H]) :- num(H).
allnum([H|T]) :- num(H), allnum(T).

alldif([]).
alldif([E|Es]) :-
    maplist(dif(E), Es),
    alldif(Es).

alldiflist([]).
alldiflist([H|T]) :-
    alldif(H),
    alldiflist(T).
