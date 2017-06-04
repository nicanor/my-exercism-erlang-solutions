-module(leap).
-export([test_version/0, leap_year/1]).

test_version() ->
  1.

leap_year(Year) when Year rem 400 =:= 0 ->
  true;
leap_year(Year) when Year rem 100 =:= 0 ->
  false;
leap_year(Year) when Year rem 4 =:= 0 ->
  true;
leap_year(_) ->
  false.
