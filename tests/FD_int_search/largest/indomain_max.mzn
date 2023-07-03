var 1..5: x;
var 1..10: y;
solve :: int_search([x, y], largest, indomain_max, complete) satisfy;

constraint x != y;

output [assert(
    fix(x) = 5 /\ fix(y) = 10,
    "Did not follow search annotation",
    "x = \(x);\ny = \(y);\n"
)];
