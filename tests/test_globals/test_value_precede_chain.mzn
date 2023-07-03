include "globals.mzn";

array [1..4] of var 1..4: x :: output = [4, _, _, 2];

constraint value_precede_chain([4, 3, 2], x);

solve :: int_search(x, input_order, indomain_min, complete) satisfy;
