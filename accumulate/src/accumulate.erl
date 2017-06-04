-module(accumulate).
-export([test_version/0,accumulate/2]).

test_version() ->
  1.

accumulate(_, []) ->
  [];

accumulate(Fn, [Head|Tail]) ->
  [Fn(Head)|accumulate(Fn,Tail)].
