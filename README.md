# Factorions
Code to hunt for factorions in any base


[![Build Status](https://travis-ci.org/scheinerman/Factorions.jl.svg?branch=master)](https://travis-ci.org/scheinerman/Factorions.jl)

[![Coverage Status](https://coveralls.io/repos/scheinerman/Factorions.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/scheinerman/Factorions.jl?branch=master)

[![codecov.io](http://codecov.io/github/scheinerman/Factorions.jl/coverage.svg?branch=master)](http://codecov.io/github/scheinerman/Factorions.jl?branch=master)


Hunt for all factorions in base-6:

```julia
julia> find_all_factorions(6);
Trying 7776 possibilities (up to 5 digits)
                 # progress bar deleted
1_6 = 1
2_6 = 2
41_6 = 25
42_6 = 26
 ```
