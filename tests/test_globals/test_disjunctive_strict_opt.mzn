/*
If your solver supports optional start times for disjunctive, you can create
new predicate which takes the underlying boolean and integer variables
directly, and call it from fzn_disjunctive_strict_opt:

predicate my_disjunctive_strict_opt(
    array [int] of var bool: occurs,
    array [int] of var int: start,
    array [int] of var int: duration
);

predicate fzn_disjunctive_strict_opt(
    array [int] of var opt int: start,
    array [int] of var int: duration
) = my_disjunctive_strict_opt(
    [occurs(s) | s in start],
    [if is_fixed(absent(s)) /\ fix(absent(s)) then 0 else deopt(s) endif | s in start],
    duration
);
*/
include "globals.mzn";

enum Task = Task(1..5);

array [Task] of var opt 1..5: start;
array [Task] of int: duration = [5, 2, 3, 2, 0];

constraint start[Task(5)] = 2;

constraint disjunctive_strict(start, duration);
constraint count (t in Task) (occurs(start[t])) >= 3;

var int: objective :: output = max (t in Task) (start[t] + duration[t]);
solve :: int_search(start, input_order, indomain_min) minimize  objective;
