include "globals.mzn";

array [1..10] of var 0..20: x :: add_to_output;
constraint all_different_except_0(x);

constraint count (v in x) (v != 0) > 3;

var 1..20: objective :: add_to_output = sum(x);
solve :: int_search(x, input_order, indomain_max, complete) minimize objective;
