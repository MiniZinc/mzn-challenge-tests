include "globals.mzn";

array[1..5] of var 1..10: x :: output = [1, 3, 5, 7, _];
array[4..8] of var 1..10: y :: output = [4: 1, 3, _, 7, 9];

constraint lex_lesseq(x, y);

var int: objective :: output = abs(sum(x) - sum(y));

solve :: int_search(x ++ y, input_order, indomain_min, complete) minimize objective;
