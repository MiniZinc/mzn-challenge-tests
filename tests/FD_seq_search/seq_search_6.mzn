var set of 1..3: x;
var bool: b;

constraint card(x) = if b then 2 else 1 endif;

solve :: seq_search([
  bool_search([b], input_order, indomain_max, complete),
  set_search([x], input_order, indomain_min, complete)
]) satisfy;

output [assert(
    fix(b) /\ fix(x) = 1..2,
    "Did not follow search annotation",
    "b = \(b);\nx = \(x);\n"
)];
