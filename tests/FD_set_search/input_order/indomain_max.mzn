var set of 1..3: x;
constraint card(x) = 2;

solve :: set_search([x], input_order, indomain_max, complete) satisfy;

output [assert(
    fix(x) = 2..3,
    "Did not follow search annotation",
    "x = \(x);\n"
)];
