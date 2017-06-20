-module(gigasecond).
-export([test_version/0, from/1]).

test_version() -> 1.

from({Y,M,D}) -> from({{Y,M,D},{0,0,0}});
from(DT) ->
  Seconds = calendar:datetime_to_gregorian_seconds(DT),
  calendar:gregorian_seconds_to_datetime(Seconds + 1000000000).
