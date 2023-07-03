var 1..5: x;
var 1..3: y;
solve :: int_search([x, y], anti_first_fail, indomain_min, complete) satisfy;

constraint x != y;

output [assert(
    fix(x) = 1 /\ fix(y) = 2,
    "Did not follow search annotation",
    "x = \(x);\ny = \(y);\n"
)];
