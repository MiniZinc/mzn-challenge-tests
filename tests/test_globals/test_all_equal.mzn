include "globals.mzn";
array [1..10] of var 1..20: x :: output;
constraint all_equal(x);

var int: objective :: output = sum(x);
solve :: int_search(x, input_order, indomain_max, complete) minimize objective;
