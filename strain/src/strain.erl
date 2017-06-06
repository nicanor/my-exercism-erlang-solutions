-module(strain).
-export([test_version/0, keep/2, discard/2]).

test_version() -> 1.

keep(_, []) -> [];
keep(P, [H|T]) ->
  case P(H) of
    true  -> [H|keep(P,T)];
    false -> keep(P,T)
  end.

discard(P, C) -> keep(fun(X) -> not P(X) end, C).
