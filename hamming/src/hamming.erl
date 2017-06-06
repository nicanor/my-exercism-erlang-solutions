-module(hamming).
-export([test_version/0, hamming_distance/2]).

test_version() -> 1.

hamming_distance([],[]) -> 0;
hamming_distance([H1|T1],[H1|T2]) -> hamming_distance(T1,T2);
hamming_distance([H1|T1],[H2|T2]) -> hamming_distance(T1,T2) + 1.
