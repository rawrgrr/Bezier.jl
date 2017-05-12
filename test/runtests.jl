using Bezier
using Base.Test

# linear interpolation
P11 = [0., 1]
P12 = [2., 3]
@test [0,     1] == bezier(0,    P11, P12)
@test [0.5, 1.5] == bezier(0.25, P11, P12)
@test [1,     2] == bezier(0.5,  P11, P12)
@test [1.5, 2.5] == bezier(0.75, P11, P12)
@test [2,     3] == bezier(1,    P11, P12)

P21 = [0. 1]
P22 = [2. 3]
@test [0     1] == bezier(0,    P21, P22)
@test [0.5 1.5] == bezier(0.25, P21, P22)
@test [1     2] == bezier(0.5,  P21, P22)
@test [1.5 2.5] == bezier(0.75, P21, P22)
@test [2     3] == bezier(1,    P21, P22)

# quadratic interpolation with vector of vectors
@test Array[[10, 5]] == bezier(0.5, Vector{Float64}[[0., 0], [10, 10], [20, 0]])

# quadratic interpolation with matrix
@test [[10 5];] == bezier(0.5, [[0. 0]; [10 10]; [20 0]])
@test [[10 5];] == bezier(0.5, [0. 0; 10 10; 20 0])

# boundary checks
@test_throws DomainError bezier(prevfloat(0.), [0., 1], [2., 3])
@test_throws DomainError bezier(nextfloat(1.), [0., 1], [2., 3])
@test_throws DomainError bezier(prevfloat(0.), Vector{Float64}[[0., 1], [2, 3]])
@test_throws DomainError bezier(nextfloat(1.), Vector{Float64}[[0., 1], [2, 3]])
@test_throws DomainError bezier(prevfloat(0.), [0. 1; 2 3])
@test_throws DomainError bezier(nextfloat(1.), [0. 1; 2 3])
