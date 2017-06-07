-module(sum_of_multiples).
-export([test_version/0, sumOfMultiples/2]).

test_version() -> 1.

sumOfMultiples(Xs, N) -> sm(Xs,1,N,0).

sm(Xs, N, N, Q) -> Q;
sm(Xs, A, N, Q) ->
  case divides(A, Xs) of
    true  -> sm(Xs,A+1,N,Q+A);
    false -> sm(Xs,A+1,N,Q)
  end.

divides(A, []) -> false;
divides(A, [X|Xs]) -> ((A rem X) == 0) orelse divides(A,Xs).
