-module(collatz_conjecture).
-export([test_version/0, steps/1]).

test_version() -> 1.

steps(N) when N < 1 -> {error, "Only strictly positive numbers are allowed"};
steps(N) -> steps(N, 0).

steps(1, Count) -> Count;
steps(N, Count) when N rem 2 =:= 0 -> steps(N div 2, Count + 1);
steps(N, Count) -> steps(N*3 + 1, Count + 1).
