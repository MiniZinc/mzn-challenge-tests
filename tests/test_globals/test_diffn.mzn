include "globals.mzn";

int: n = 3;
int: w = 10;
int: h = 10;

array [1..n] of var 1..w: x;
array [1..n] of var 1..h: y;

array [1..n] of var 1..w: dx;
array [1..n] of var 1..h: dy;

var int: objective :: output = max (i in 1..n) (x[i] + dx[i]) * max (i in 1..n) (y[i] + dy[i]);

constraint diffn(x, y, dx, dy);

constraint let {
  array [int] of var int: d = dx ++ dy;
} in forall (i, j in index_set(d) where i < j) (d[i] != d[j]);

solve :: int_search(x ++ y ++ dx ++ dy, input_order, indomain_min, complete) minimize objective;
