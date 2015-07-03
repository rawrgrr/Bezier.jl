module Bezier

export bezier

# Linear interpolation between two points
function bezier{T<:FloatingPoint}(t::Real, P1::Array{T}, P2::Array{T})
    if 0 ≤ t ≤ 1
        return P1 + t * (P2 - P1)
    else
        throw(DomainError("t must be bounded by [0, 1]"))
    end
end

# Higher-order interpolation
function bezier{T<:FloatingPoint}(t::Real, points::Vector{Vector{T}})
    dimension = size(points, 1)
    if dimension ≤ 1
        return points
    else
        interpolated_points = Array(Vector{T}, dimension - 1)
        for i in 2:dimension
            interpolated_points[i - 1] = bezier(t, points[i - 1], points[i])
        end
        return bezier(t, interpolated_points)
    end
end

# Each row of the matrix is a point
function bezier{T<:FloatingPoint}(t::Real, points::Matrix{T})
    rows, cols = size(points)
    if rows ≤ 1
        return points
    else
        interpolated_points = Array(T, rows - 1, cols)
        for r in 2:rows
            interpolated_point = bezier(t, points[r - 1, :], points[r, :])
            for c in 1:cols
                interpolated_points[r - 1, c] = interpolated_point[c]
            end
        end
        return bezier(t, interpolated_points)
    end
end

end # module
