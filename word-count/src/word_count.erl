-module(word_count).
-export([test_version/0, count/1]).

test_version() -> 1.

count(S) -> count(words(S), dict:new()).

words(String) -> string:tokens(string:to_lower(String), " .,_!&@$%^&:#").

count([]    , Counts) -> Counts;
count([X|Xs], Counts) -> count(Xs, dict:update_counter(X, 1, Counts)).
