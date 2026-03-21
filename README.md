# Factorions

Code to hunt for factorions in any base.

## Example
Hunt for all factorions in base six:

```
julia> using Factorions

julia> find_factorions(6);
Trying 7776 possibilities (up to 5 digits)
1_6 = 1
2_6 = 2
41_6 = 25
42_6 = 26

julia> find_factorions(9);
Trying 4782969 possibilities (up to 7 digits)
1_9 = 1
2_9 = 2
62558_9 = 41282

julia> find_factorions(10);
Trying 100000000 possibilities (up to 8 digits)
1_10 = 1
2_10 = 2
145_10 = 145
40585_10 = 40585
```
