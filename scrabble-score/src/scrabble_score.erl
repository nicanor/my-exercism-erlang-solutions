-module(scrabble_score).
-export([test_version/0, score/1]).

test_version() -> 1.

score(Word) -> score(string:to_lower(Word), 0).
score([],Count) -> Count;
score([X|Xs],Count) -> points(X) + score(Xs).

points($d) ->  2;
points($g) ->  2;
points($b) ->  3;
points($c) ->  3;
points($m) ->  3;
points($p) ->  3;
points($f) ->  4;
points($h) ->  4;
points($v) ->  4;
points($w) ->  4;
points($y) ->  4;
points($k) ->  5;
points($j) ->  8;
points($x) ->  8;
points($q) -> 10;
points($z) -> 10;
points(XX) ->  1.
