include "globals.mzn";

var 1..6: bound;

constraint cumulative([0, 3, 4, 6, 8, 8],  % start
                      [3, 2, 5, 2, 1, 4],  % duration
                      [2, 3, 1, 4, 3, 2],  % resource usage
                      bound);

solve :: int_search([bound], input_order, indomain_min, complete) satisfy;
