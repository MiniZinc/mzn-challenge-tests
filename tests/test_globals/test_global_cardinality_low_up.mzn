include "globals.mzn";

array[1..4] of var 0..8: x;

constraint x[3] = 8;

constraint global_cardinality(
    x,
    [3, 5, 6],
    [2, 0, 1],
    [3, 2, 1]
);

solve :: int_search(x, input_order, indomain_min, complete) satisfy;
