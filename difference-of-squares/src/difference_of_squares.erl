-module(difference_of_squares).
-export([test_version/0,
         sum_of_squares/1,
         square_of_sums/1,
         difference_of_squares/1]).

test_version() -> 1.

sum_of_squares(N) -> N*(N+1)*(2*N+1) div 6.

square_of_sums(N) ->
  Sums = N*(N+1) div 2,
  Sums * Sums.

difference_of_squares(N) -> square_of_sums(N) - sum_of_squares(N).
