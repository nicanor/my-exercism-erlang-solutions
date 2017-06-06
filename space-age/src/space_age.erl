-module(space_age).
-export([test_version/0, ageOn/2]).

test_version() -> 1.

-define(SIEY, 31557600). % SECONDS_IN_EARTH_YEAR

ageOn(P, S) -> S / on(P) / ?SIEY.

on(earth)   ->   1.00000000;
on(mercury) ->   0.24084670;
on(venus)   ->   0.61519726;
on(mars)    ->   1.88081580;
on(jupiter) ->  11.86261500;
on(saturn)  ->  29.44749800;
on(uranus)  ->  84.01684600;
on(neptune) -> 164.79132000.
