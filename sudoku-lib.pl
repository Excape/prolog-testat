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
