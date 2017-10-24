:- use_module(library(clpfd)).

% helper predicates
in_range(X) :- between(1,4,X).
all_in_range([H]) :- in_range(H).
all_in_range([H|T]) :-
    in_range(H),
    all_in_range(T).

all_unique(L) :-
    maplist(all_distinct, L).

sudoku(A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4) :-
	% Check if numbers are in range {1-4}
	all_in_range([A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4]),

    % Check if each row/column/block has unique numbers
    all_unique([
      % Rows
      [A1, A2, A3, A4],
      [B1, B2, B3, B4],
      [C1, C2, C3, C4],
      [D1, D2, D3, D4],
      % Columns
      [A1, B1, C1, D1],
      [A2, B2, C2, D2],
      [A3, B3, C3, D3],
      [A4, B4, C4, D4],
      % Blocks
      [A1, A2, B1, B2],
      [A3, A4, B3, B4],
      [C1, C2, D1, D2],
      [C3, C4, D3, D4]
    ]).

append([],L,L).
append([H|T],L2,[H|L3]) :- append(T,L2,L3).

getFirst([], AccRest, AccRest, Acc, Acc).
getFirst([[H1|T1]|T2], AccRest, Rest, Acc, R) :- append(Acc, [H1], L3), append(AccRest, [T1], L4), getFirst(T2, L4, Rest, L3, R).

toCol([[]|_], Acc, Acc).
toCol(L, Acc, R) :- getFirst(L, [], Rest, [], Col), append(Acc, [Col], L3), toCol(Rest,  L3, R).
toCol(Rows, Cols) :- toCol(Rows, [], Cols).

/** <examples>
?- toCol( [[11, 12, 13, 14, 15, 16, 17, 18, 19],
            [21, 22, 23, 24, 25, 26, 27, 28, 29],
            [31, 32, 33, 34, 35, 36, 37, 38, 39],
            [41, 42, 43, 44, 45, 46, 47, 48, 49],
            [51, 52, 53, 54, 55, 56, 57, 58, 59],
          	 [61, 62, 63, 64, 65, 66, 67, 68, 69],
            [71, 72, 73, 74, 75, 76, 77, 78, 79],
            [81, 82, 83, 84, 85, 86, 87, 88, 89],
            [91, 92, 93, 94, 95, 96, 97, 98, 99]], X)
*/
