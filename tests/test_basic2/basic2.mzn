int: n;
int: m;
int: p;
int: q;

var 1..n: x;
var 1..m: y;

constraint x < p -> x > y;
constraint y > q -> x > q;
constraint x != y;

solve :: int_search([x, y], input_order, indomain_min, complete) maximize x + y;
