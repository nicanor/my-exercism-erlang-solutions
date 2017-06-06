-module(triangle).
-export([test_version/0, kind/3]).

test_version() -> 1.

kind(X,Y,Z) when X=<0; Y=<0; Z=<0 ->
  {error, "all side lengths must be positive"};

kind(X,Y,Z) when X+Y=<Z; X+Z=<Y; Y+Z=<X ->
  {error, "side lengths violate triangle inequality"};

kind(X,X,X) -> equilateral;
kind(X,X,Y) -> isosceles;
kind(X,Y,X) -> isosceles;
kind(Y,X,X) -> isosceles;
kind(_,_,_) -> scalene.
