-module(atbash_cipher).
-export([test_version/0, encode/1, decode/1]).

test_version() -> 1.

decode([])      -> [];
decode([32|Xs]) -> decode(Xs);
decode([C|Xs]) when C >= $a, C =< $z -> [$a + $z - C| decode(Xs)];
decode([C|Xs]) -> [C | decode(Xs)].

encode(Xs) -> string:strip(encode(Xs,0)).

encode([],N) -> [];
encode(Xs,5) -> [32 | encode(Xs,0)];
encode([C|Xs],N) when C >= $a, C =< $z -> [$a + $z - C | encode(Xs,N+1)];
encode([C|Xs],N) when C >= $A, C =< $Z -> [$a + $Z - C | encode(Xs,N+1)];
encode([C|Xs],N) when C >= $0, C =< $9 -> [C | encode(Xs,N+1)];
encode([C|Xs],N) -> encode(Xs,N).
