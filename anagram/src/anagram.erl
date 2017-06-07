-module(anagram).
-export([test_version/0, find/2]).

test_version() -> 1.

find(A,L) -> lists:filter(fun(X)-> is_anagram(A,X) end, L).

is_anagram(A,B) -> anagram(string:to_lower(A),string:to_lower(B)).
anagram(A,A) -> false;
anagram(A,B) -> lists:sort(A) == lists:sort(B).
