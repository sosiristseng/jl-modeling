# # Get 2D indices from a linear index
# Use `CartesianIndices((N, M))`, from this [post](https://discourse.julialang.org/t/julia-usage-how-to-get-2d-indexes-from-1d-index-when-accessing-a-2d-array/61440).

x = rand((7, 10))
CI = CartesianIndices((7, 10))

for i in eachindex(x)
    r = CI[i][1]
    c = CI[i][2]
    @assert x[i] == x[r, c]
end
