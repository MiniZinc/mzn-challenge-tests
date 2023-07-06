include "globals.mzn";

array [int] of var 1..10: x :: output = [5, _, 3, _, 1];
constraint decreasing(x);

var int: objective :: output = sum(x);

solve :: int_search(x, input_order, indomain_max, complete) minimize objective;
