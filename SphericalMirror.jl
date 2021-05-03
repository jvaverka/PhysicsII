# focal point
f = 5

# object distance
dₒ = [25, 22.5, 20, 17.5, 15, 12.5, 10, 7.5, 3.5]

# image distance
dᵢ = similar(dₒ)
for i = 1:length(dᵢ)
    dᵢ[i] = abs((f^-1 - dₒ[i]^-1)^-1)
end

# image height (theoretical)
hᵢ = similar(dᵢ)
hₒ = 1
for i = 1:length(hᵢ)
    m = -dᵢ[i] / dₒ[i]
    hᵢ[i] = m * hₒ
end

# image height (experimental)
hₘ = similar(hᵢ)
dₘ = [6.7, 7.1, 7.5, 7.9, 8.9, 9.9, 10, 16.3, 11.7]
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
