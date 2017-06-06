-module(space_age).
-export([test_version/0, ageOn/2]).

test_version() -> 1.

-define(SIEY, 31557600). % SECONDS_IN_EARTH_YEAR
-define(SIPY, #{ earth  =>   1.00000000 * ?SIEY,
                mercury =>   0.24084670 * ?SIEY,
                venus   =>   0.61519726 * ?SIEY,
                mars    =>   1.88081580 * ?SIEY,
                jupiter =>  11.86261500 * ?SIEY,
                saturn  =>  29.44749800 * ?SIEY,
                uranus  =>  84.01684600 * ?SIEY,
                neptune => 164.79132000 * ?SIEY}).

ageOn(P, S) -> S / maps:get(P, ?SIPY).
