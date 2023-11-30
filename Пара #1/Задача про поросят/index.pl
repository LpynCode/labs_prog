mark(fauna).
mark(flora).
mark(sport).
mark(space).

char(volf).
char(nuf).
char(naf).
char(nif).


is_left(X, Y, [X, Y, _, _]).
is_left(X, Y, [_, X, Y, _]).

is_right(Y, X, [_, _, X, Y]).
is_right(Y, X, [Y, _, _, X]).

is_oposite(X, Y, [X, _, Y, _]).
is_oposite(X, Y, [_, X, _, Y]).
is_oposite(X, Y, [Y, _, X, _]).
is_oposite(X, Y, [_, Y, _, X]).

unique([]).
unique([First|Rest]):- not(member(First, Rest)), unique(Rest).

check(Predicates) :- 
    member(take(volf, fauna), Predicates),
    is_left(take(volf, _), take(naf, _), Predicates),
    is_right(take(nif, _), take(_, space), Predicates),
    is_oposite(take(nuf, NufTakes), take(naf, _), Predicates),
    NufTakes \= sport.


solve(Predicates) :- 

    Predicates = [take(A, MarkA), take(B, MarkB), take(C, MarkC), take(D, MarkD)],

    char(A),
    char(B),
    char(C),
    char(D),

    mark(MarkA),
    mark(MarkB),
    mark(MarkC),
    mark(MarkD),

    check(Predicates),

    unique([A, B, C, D]),
    unique([MarkA, MarkB, MarkC, MarkD]).







