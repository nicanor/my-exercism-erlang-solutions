-module(rna_transcription).
-export([test_version/0, to_rna/1]).

test_version() -> 1.

to_rna("")  ->  [];
to_rna("G") -> "C";
to_rna("C") -> "G";
to_rna("T") -> "A";
to_rna("A") -> "U";
to_rna([H|T]) -> to_rna([H]) ++ to_rna(T).
