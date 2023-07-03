include "globals.mzn";

int: n_states      = 5;
int: input_max     = 3;
int: initial_state = 1;
set of int: accepting_states = {5};
array[1..5, 1..3] of int: transition_fn =
    [|2, 0, 0   % transitions from state 1:   --1--> state 2
     |0, 3, 0   % transitions from state 2:   --2--> state 3
     |0, 4, 3   % transitions from state 3:   --2--> state 4, --3--> state 3
     |5, 0, 0   % transitions from state 4:   --1--> state 5
     |0, 0, 0|];% transitions from state 5:   (none)

array [-2..4]  of var 1..5: reg_input :: output = [-2: 1, 2, _, _, _, 2, 1];

constraint regular(reg_input, n_states, input_max, transition_fn,
                   initial_state, accepting_states);

solve :: int_search(reg_input, input_order, indomain_min, complete) satisfy;
