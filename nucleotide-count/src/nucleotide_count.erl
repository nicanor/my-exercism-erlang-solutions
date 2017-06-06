-module(nucleotide_count).
-export([test_version/0, nucleotide_counts/1, count/2]).

test_version() -> 1.

count(DNA, [N]) -> count(N, counts(DNA));
count($A, {Count,_,_,_}) -> Count;
count($T, {_,Count,_,_}) -> Count;
count($C, {_,_,Count,_}) -> Count;
count($G, {_,_,_,Count}) -> Count;
count(_,_) -> erlang:error("Invalid nucleotide").

nucleotide_counts({A,T,C,G}) -> [{"A",A}, {"T",T}, {"C",C}, {"G",G}];
nucleotide_counts(DNA) -> nucleotide_counts(counts(DNA)).

counts(DNA) -> counts(DNA, {0,0,0,0}).

counts([      ], {A,T,C,G}) -> {A,T,C,G};
counts([$A|DNA], {A,T,C,G}) -> counts(DNA, {A+1,T,C,G});
counts([$T|DNA], {A,T,C,G}) -> counts(DNA, {A,T+1,C,G});
counts([$C|DNA], {A,T,C,G}) -> counts(DNA, {A,T,C+1,G});
counts([$G|DNA], {A,T,C,G}) -> counts(DNA, {A,T,C,G+1}).
