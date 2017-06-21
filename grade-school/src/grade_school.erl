-module(grade_school).
-export([test_version/0, new/0, add/3, get/2, sort/1]).

test_version() -> 1.

new()              -> #{}.
get(Grade, School) -> maps:get(Grade, School, []).
sort(School)       -> maps:to_list(School).

add(Student, Grade, School) ->
  NewList = lists:sort([Student|get(Grade, School)]),
  maps:put(Grade, NewList, School).
