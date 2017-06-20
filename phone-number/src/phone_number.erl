-module(phone_number).
-export([test_version/0, number/1, areacode/1, pretty_print/1]).
-define(INVALID, "0000000000").

test_version() -> 1.

number(N) -> n([X || X <- N, X >= $0, X =< $9]).

n([$1|Xs]) when length(Xs) == 10 -> Xs;
n(Xs)      when length(Xs) == 10 -> Xs;
n(_) -> ?INVALID.

areacode([$1,A,B,C,_,_,_,_,_,_,_]) -> [A,B,C];
areacode(   [A,B,C,_,_,_,_,_,_,_]) -> [A,B,C].

pretty_print([$1,A,B,C,D,E,F,G,H,I,J]) -> pretty_print([A,B,C,D,E,F,G,H,I,J]);
pretty_print(   [A,B,C,D,E,F,G,H,I,J]) -> [$(,A,B,C,$),32,D,E,F,$-,G,H,I,J].
