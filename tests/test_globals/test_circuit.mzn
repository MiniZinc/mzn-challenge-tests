% Circuit needs to be able to handle non-1-based index sets
% To do this, you can pass the minimum of the index set as an additional argument to your custom predicate
%
% predicate my_circuit(array [int] of var int: x, int: min_idx);
% predicate fzn_circuit(array [int] of var int: x) = my_circuit(x, min(index_set(x)));

include "globals.mzn";

array[1..4] of var 1..4: c1 :: output;
array[2..5] of var -100..100: c2 :: output;

constraint circuit(c1);
constraint circuit(c2);

solve :: seq_search([
    int_search(c1, input_order, indomain_min, complete),
    int_search(c2, input_order, indomain_min, complete),
]) satisfy;
