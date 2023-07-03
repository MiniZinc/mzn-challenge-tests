var 1..5: x;
var 3..5: y;
solve :: int_search([x, y], anti_first_fail, indomain_max, complete) satisfy;

constraint x != y;

output [assert(
    fix(x) = 5 /\ fix(y) = 4,
    "Did not follow search annotation",
    "x = \(x);\ny = \(y);\n"
)];
