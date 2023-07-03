MiniZinc Challenge Test Suite
=============================

This repository contains a portion of the models used to check for solver eligibility in the annual [MiniZinc Challenge](https://www.minizinc.org/challenge.html).

The [MiniZinc Challenge Submission System](https://challenge.minizinc.org) automatically runs these tests, as well as a collection of previous Challenge problems on all submitted solvers. It checks for the following:

- The solver does not crash or give an error in an unexpected way (e.g. crashing due to a SEGFAULT, but not from running out of time/memory)
- Any assertions in the test cases are correctly upheld where required for the solver's entry class
- The solver does not produce any incorrect solutions
- The solver does not produce any incorrect statuses (e.g. reporting of optimality for which a solution of better quality is known)

The Challenge Submission System additionally produces output showing the generated FlatZinc predicates for each instance so that solver developers can check that their redefinitions library is functioning as expected.

These test cases are published here to aid solver developers who wish to utilise the tests themselves outside of the submission system.

## Repository structure

- The test cases are organised similarly to how the MiniZinc Challenge benchmark problems are structured, with directories either containing model files to run, or a model file along with data files to run.
- The test cases in `tests/FD_*` are only used for the solvers entering the `FD` entry class, and not required for `FREE` or `PAR`/`OPEN` solvers.
- The test cases in `tests/globals` are designed as a good test of whether your solver redefinitions are working correctly. It may be useful to compile them with `-c` and check that the correct FlatZinc predicates are being generated.
