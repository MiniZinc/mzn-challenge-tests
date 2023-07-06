include "inverse.mzn";

array [int] of var -100..100: f :: add_to_output = [2: 5, 3: 7, 4: _, 5: _];
array [int] of var -100..100: g :: add_to_output = [5: 2, 6: _, 7: 3, 8: _];
constraint inverse(f, g);

solve :: int_search(f, input_order, indomain_min) satisfy;
