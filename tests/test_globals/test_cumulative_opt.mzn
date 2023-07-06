/*
If your solver supports optional start times for cumulative, you can create
new predicate which takes the underlying boolean and integer variables
directly, and call it from fzn_cumulative_opt:

predicate my_cumulative_opt(
    array [int] of var bool: occurs,
    array [int] of var int: start,
    array [int] of var int: duration,
    array [int] of var int: resource
    var int: bound
);

predicate fzn_cumulative_opt(
    array [int] of var opt int: start,
    array [int] of var int: duration,
    array [int] of var int: resource,
    var int: bound
) = my_cumulative_opt(
    [occurs(s) | s in start],
    [if is_fixed(absent(s)) /\ fix(absent(s)) then 0 else deopt(s) endif | s in start],
    duration,
    resource,
    bound
);
*/

include "globals.mzn";

enum Task = Task(1..5);

array [Task] of var opt 1..5: start;
array [Task] of int: duration = [5, 2, 3, 2, 3];
array [Task] of int: weight   = [3, 1, 2, 4, 2];

constraint cumulative(start, duration, weight, 4);

var int: end = max (t in Task) (start[t] + duration[t]);
constraint end <= 7;

var int: objective :: output = count (t in Task) (occurs(start[t]));
constraint objective > 0;

solve :: int_search(start, input_order, indomain_min) maximize objective;
