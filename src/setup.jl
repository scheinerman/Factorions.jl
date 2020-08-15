using ShowSet, Distributed, Factorions
@info "Setting up for parallel execution with $(Threads.nthreads()) threads"

addprocs(Threads.nthreads())
@everywhere using Factorions
