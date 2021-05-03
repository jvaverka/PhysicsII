# focal point
f = 7.5

# object distance
dₒ = [30.0, 25.0, 20.0, 15.0, 10.5, 5.25]

# image distance
dᵢ = similar(dₒ)
for i = 1:length(dᵢ)
    dᵢ[i] = abs((f^-1 - dₒ[i]^-1)^-1)
end

# image height (theoretical)
hᵢ = similar(dᵢ)
hₒ = 20
for i = 1:length(hᵢ)
    m = -dᵢ[i] / dₒ[i]
    hᵢ[i] = m * hₒ
end

# image height (experimental)
hₘ = similar(hᵢ)
dₘ = [9.5, 10.1, 11.7, 15.1, 29.8, 17.5]
for i = 1:length(hₘ)
    m = -dₘ[i] / dₒ[i]
    hₘ[i] = m * hₒ
end

# percent error - distance
dₚ = similar(dₘ)
for i = 1:length(dₚ)
    dₚ[i] = abs((dₘ[i] - dᵢ[i]) / dᵢ[i]) * 100
end

# percent error - height
hₚ = similar(hₘ)
for i = 1:length(hₚ)
    hₚ[i] = abs((hₘ[i] - hᵢ[i]) / hᵢ[i]) * 100
end
