include "globals.mzn";
array [1..10] of var 1..20: x :: add_to_output;
constraint all_different(x);

var 1..20: objective :: add_to_output = x[1];
solve :: int_search(x, input_order, indomain_max, complete) minimize objective;
