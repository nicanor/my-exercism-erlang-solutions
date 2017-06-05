-module(rna_transcription).
-export([test_version/0, to_rna/1]).

test_version() -> 1.

to_r($G) -> $C;
to_r($C) -> $G;
to_r($T) -> $A;
to_r($A) -> $U.

to_rna([]) -> [];
to_rna([H|T]) -> [to_r(H)|to_rna(T)].
