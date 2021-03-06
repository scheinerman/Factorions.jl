module Factorions
using Memoize, ProgressMeter, Distributed

export is_factorion, fact_upper_bound, find_factorions, string_base
export find_in_range, find_in_parallel


@memoize function fast_fact(n::Int)
    return factorial(n)
end

"""
`sum_fact_digs(n)` returns the sum of the factorials of the
base-10 digits of `n`.
"""
function sum_fact_digs(n::Int, b::Int = 10)
    digs = digits(n, base = b)
    sum(map(fast_fact, digs))
end



"""
`is_factorion(n,b=10)` determines if `n` is a base-`b` *factorion*; 
that is, if `n` is equal to the sum of the factorials of its base-`b` digits.
"""
function is_factorion(n::Int, b::Int = 10)::Bool
    if n <= 0
        return false
    end
    return n == sum_fact_digs(n, b)
end



"""
`fact_upper_bound(b=10)` returns an upper bound on the number of digits in
a base-`b` factorion.
"""
function fact_upper_bound(b::Int = 10)
    n::Int = 1
    fmax = fast_fact(b - 1)
    while b^(n - 1) < fmax * n
        n += 1
    end
    return n
end



function find_factorions(b::Int = 10)
    stop = b^fact_upper_bound(b)
    println("Trying $stop possibilities (up to $(fact_upper_bound(b)) digits)")
    list = Int[]
    PM = Progress(stop)
    for n = 1:stop
        if is_factorion(n, b)
            push!(list, n)
        end
        next!(PM)
    end
    for x in list
        println("$(string_base(x,b)) = $x")
    end

    return Set(list)

end

function find_in_range(rng, b::Int = 10)
    list = Int[]
    for x in rng
        if is_factorion(x, b)
            push!(list, x)
        end
    end
    return Set(list)
end

function find_in_parallel(b::Int = 10)
    stop = b^fact_upper_bound(b)
    println("Trying $stop possibilities (up to $(fact_upper_bound(b)) digits)")
    np = Threads.nthreads()
    #println(addprocs(np))
    results = Vector{Any}(undef, np)

    for j = 1:np
        rng = j:np:stop
        @info "Spawning process #$j"
        results[j] = @spawnat j + 1 find_in_range(rng, b)
    end
    sets = fetch.(results)
    X = union(sets...)
    for n in sort(collect(X))
        println("$n \t $(string_base(n,b))")
    end
    return union(sets...)
end

"""
`string_base(n,b)` renders the nonnegative integer `n` in  
base `b` (we require `1 < b < 37`).
"""
function string_base(n::Int, b::Int = 10)
    symbs = "0123456789abcdefghijklmnopqrstuvwxyz"
    digs = digits(n, base = b)
    chars = [symbs[k+1] for k in digs]
    return join(reverse(chars)) * "_$b"
end


end # module
