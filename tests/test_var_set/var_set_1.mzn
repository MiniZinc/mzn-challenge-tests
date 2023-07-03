% Solver which do not have native support for set variables should add
%   include "nosets.mzn";
% to redefinitions.mzn

var set of 1..3: x;
var set of 2..4: y;
var int: objective = card(x intersect y);
solve :: set_search([x, y], input_order, indomain_max, complete) maximize objective;
