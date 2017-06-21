-module(allergies).
-export([test_version/0, allergies/1, is_allergic_to/2]).

test_version() -> 1.

allergies(N) -> [allergy(X) || X <- [1,2,4,8,16,32,64,128], (N band X) > 0].

is_allergic_to(A, N) -> lists:member(A, allergies(N)).

allergy(  1) -> eggs;
allergy(  2) -> peanuts;
allergy(  4) -> shellfish;
allergy(  8) -> strawberries;
allergy( 16) -> tomatoes;
allergy( 32) -> chocolate;
allergy( 64) -> pollen;
allergy(128) -> cats.
