include "globals.mzn";
array [1..3] of var set of 1..3: x :: output;
constraint all_disjoint(x);

var int: objective :: output = sum (x_i in x) (card(x_i));
solve :: set_search(x, input_order, indomain_min, complete) minimize objective;
