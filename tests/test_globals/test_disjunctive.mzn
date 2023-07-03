include "globals.mzn";

array [1..3] of var 1..10: s = [1, _, _];
array [1..3] of var 0..10: d = [_, 3, 2];

constraint disjunctive(s, d);

var int: objective :: output = max (i in 1..3) (s[i] + d[i]);

solve :: int_search(s ++ d, input_order, indomain_min, complete) minimize objective;
