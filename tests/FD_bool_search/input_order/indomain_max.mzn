var bool: x;
var bool: y;

constraint x != y;

solve :: bool_search([x, y], input_order, indomain_max, complete) satisfy;

output [assert(
    fix(x) /\ not fix(y),
    "Did not follow search annotation",
    "x = \(x);\ny = \(y);\n"
)];
