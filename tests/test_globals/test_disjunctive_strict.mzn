include "globals.mzn";

array [int] of var 1..10: s = [1, _, _, 5];
array [int] of var 0..10: d = [_, 3, 2, 0];

constraint disjunctive_strict(s, d);

var int: objective :: output = max (i in 1..4) (s[i] + d[i]);

solve :: int_search(s ++ d, input_order, indomain_min, complete) minimize objective;
