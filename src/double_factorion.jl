"""
    is_double_factorion(a::Int)::Bool

Determine if `a` is a double factorion. That is,:
* `a` is not a factorion and
* if `b` is the sum of the factorials of `a`'s digits, then `a` is the sum of the  factorials of `b`'s digits.
"""
function is_double_factorion(a::Int)::Bool
    b = sum_fact_digs(a)
    if a==b
        return false
    end
    return sum_fact_digs(b) == a
end


function find_double_factorions(amax::Int=10_000_000)
    [n for n in 1:amax if is_double_factorion(n)]
end

function is_triple_factorion(a::Int)::Bool
    b = sum_fact_digs(a)
    if a==b 
        return false 
    end

    c = sum_fact_digs(b)
    return sum_fact_digs(c)  == a
end


function find_triple(amax::Int = 10_000_000)
    [n for n in 1:amax if is_triple_factorion(n)]
end


