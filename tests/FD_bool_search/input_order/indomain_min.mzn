var bool: x;
var bool: y;

constraint x != y;

solve :: bool_search([x, y], input_order, indomain_min, complete) satisfy;

output [assert(
    not fix(x) /\ fix(y),
    "Did not follow search annotation",
    "x = \(x);\ny = \(y);\n"
)];
