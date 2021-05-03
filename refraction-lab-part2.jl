"""
    snells(x[, y])

Snell's Law
formula used to describe the relationship between the angles of
incidence and refraction, when referring to light or other waves
passing through a boundary between two different isotropic media,
such as water, glass, or air.

Used to find the index of refraction.

# Examples
```julia-repl
julia> bar([1, 2], [1, 2])
1
```
"""
function snells(n₁, θ₁, θ₂)
    n₁ * sin(θ₁) / sin(θ₂)
end

incident = collect(range(0.0, 40.0, step=5))
push!(incident, 43.0)
refracted = [0.0, 7.0, 14.5, 21.2, 29.0, 37.5, 46.0, 56.5, 70.0, 90.0]

# critical angle at 43°
n = sin(deg2rad(43.0))

plot(
    sin.(deg2rad.(refracted)),
    sin.(deg2rad.(incident)),
    seriestype=:scatter,
    title="Index of Refraction",
    xlabel="refracted",
    ylabel="incident",
    legend=false
)

# savefig("/home/jake/dev/learn/PhysicsII/index_of_refraction2.png")

myrise = sin.(deg2rad.(incident))[9] - sin.(deg2rad.(incident))[2]
myrun = sin.(deg2rad.(refracted))[9] - sin.(deg2rad.(refracted))[2]

myslope = myrise/myrun
isapprox(n, myslope, atol=0.01)

n₁, n₂ = 1.51, 0.679
100*abs(n₁-n₂)/((n₁+n₂)/2)
