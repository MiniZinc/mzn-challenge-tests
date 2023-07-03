include "globals.mzn";

array [int] of var 1..10: x :: output = [1, _, 3, _, 5];
constraint increasing(x);

var int: objective :: output = sum(x);

solve :: int_search(x, input_order, indomain_max, complete) minimize objective;
