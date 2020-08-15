using Test, Factorions

@test is_factorion(145)
@test find_all_factorions(6) == Set([1, 2, 25, 26])
