# Note: This is very initial version of the GraphBLAS implementation using Chapel

# Operations
Currently supported operations are:

* apply(X, op) - apply unary operation 'op' to each of the elemnts of 'X'
* dot(X, Y) - calculate dot product of two vectors 'X' and 'Y'
* nrm2(X) - calculate Euclidean norm of a given vector 'X'

Support for the operations will be added soon.

# Structure
Currently each operation alongside with it's benchmarking code it placed under it's own file.
To benchmark a specific operation compile concrete chpl file, then run it from 'RunBenchmarkAndPlot' notebook to see benchmark results and plot.
Notebook free of benchmarking will be added soon.
