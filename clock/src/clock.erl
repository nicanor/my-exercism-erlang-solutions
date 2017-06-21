-module(clock).
-export([test_version/0, create/2, is_equal/2, to_string/1, minutes_add/2]).

test_version() -> 1.

to_s(N) when N < 10 -> [$0|integer_to_list(N)];
to_s(N) -> integer_to_list(N).

minute_number(X)  -> (X rem 1440 + 1440) rem 1440.
is_equal(C1, C2)  -> C1 =:= C2.
create(H, M)      -> minute_number(H*60 + M).
minutes_add(C, M) -> minute_number(C    + M).
to_string(C)      -> to_s(C div 60) ++ ":" ++ to_s(C rem 60).
