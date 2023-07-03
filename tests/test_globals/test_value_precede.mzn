include "globals.mzn";

array [1..4] of var 1..4: x :: output = [_, 3, _, 2];

constraint value_precede(4, 3, x);

solve :: int_search(x, input_order, indomain_min, complete) satisfy;
