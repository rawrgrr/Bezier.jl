# Bezier

[![Build Status](https://travis-ci.org/rawrgrr/Bezier.jl.svg?branch=master)](https://travis-ci.org/rawrgrr/Bezier.jl)

Interpolation for arbitrary order [Bézier curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Higher-order_curves) in julia

Linear interpolation between two points with `bezier(t, P1, P2)`
  - `P1` coordinate for one point
  - `P2` coordinate for second point
  - `0 ≤ t ≤ 1` defines how close to `P1` vs `P2` to interpolate
```julia
julia> using Bezier

julia> bezier(0.25, [1. 2], [3. 4]) # This is a quarter of the way between [1 2] and [3 4]
1x2 Array{Float64,2}:
 1.5  2.5

julia> bezier(0.5, [1. 2], [3. 4]) # This finds the midpoint between [1 2] and [3 4]
1x2 Array{Float64,2}:
 2.0  3.0

julia> bezier(0.8, [1. 2], [3 4]) # This is 80% of the way from [1 2] to [3 4]
1x2 Array{Float64,2}:
 2.6  3.6
```

Interpolate between an Array of points using `bezier(t, ::Array{Array{FloatingPoint,1},1}`
```julia
julia> bezier(0.5, Vector{FloatingPoint}[[0., 0], [10, 10], [20, 0]]) # quadratic interpolation
1-element Array{Array{FloatingPoint,1},1}:
 FloatingPoint[10.0,5.0]
```

Or as a matrix (where each row represents a point) using `bezier(t, ::Array{FloatingPoint,2}`
```julia
julia> bezier(0.5, [0. 0; 5 5; 10 0; 15 5]) # cubic interpolation as a matrix
1x2 Array{Float64,2}:
 7.5  2.5
```
