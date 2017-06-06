-module(bob).
-export([response_for/1, test_version/0]).

test_version() -> 1.

% Based on m4ver1k's response
response_for(Str) ->
    Shouting = (string:to_upper(Str) == Str) and (re:run(Str, "[A-Za-z]") /= nomatch),
    Silent   = string:strip(Str) == [],
    Ask      = lists:suffix("?", Str),

    if Silent   -> "Fine. Be that way!";
       Shouting -> "Whoa, chill out!";
       Ask      -> "Sure.";
       true     ->"Whatever."
    end.
