using Plots
using Statistics

function wavelenthslope(x, y)
    xdiff = [ i - mean(x) for i ∈ x ]
    ydiff = [ j - mean(y) for j ∈ y ]
    sum( xdiff .* ydiff ) / sum( xdiff .^ 2)
end

# D
d = 0.000125
L = 3.8
yₘ = [
    -0.093, -0.0765, -0.0575, -0.038, -0.0195,
     0.019,  0.0365,  0.0575,  0.076,  0.0935
]
m = deleteat!(collect(-5:5), 6)
scatter(
    L .* m,
    d .* yₘ,
    title = "Wavelength",
    xlabel = "mL",
    ylabel = "dyₘ",
    label = "D",
    legend = :bottomright,
    smooth = true
)
println(
    "slope:",
    round(wavelenthslope(L .* m, d .* yₘ)*1e9, digits=2),
    "nm"
)

# E
d = 0.00025
L = 3.8
yₘ = [-0.1045, -0.094, -0.0835, -0.0755, -0.066, -0.056,
      -0.047, - 0.038, -0.028, - 0.0195, -0.01,
       0.0095,  0.019,  0.028,   0.0375,  0.047,  0.057,
       0.067,   0.077,  0.086,   0.096,   0.1055
]
m = deleteat!(collect(-11:11), 12)
scatter!(
    L .* m,
    d .* yₘ,
    # title = "Wavelength",
    # xlabel = "mL",
    # ylabel = "dyₘ",
    label = "E",
    # legend = :bottomright,
    smooth = true
)
println(
    "slope:",
    round(wavelenthslope(L .* m, d .* yₘ)*1e9, digits=2),
    "nm"
)

# F
d = 0.00025
L = 3.8
yₘ = [-0.108, -0.0985, -0.088, -0.079, -0.068, -0.0585,
      -0.049, -0.038,  -0.029, -0.019, -0.01,
       0.0095, 0.0195,  0.0295, 0.0395, 0.0495, 0.06,
       0.0705, 0.0805,  0.09,   0.101,  0.1105

]
m = deleteat!(collect(-11:11), 12)
scatter!(
    L .* m,
    d .* yₘ,
    # title = "Wavelength",
    # xlabel = "mL",
    # ylabel = "dyₘ",
    label = "F",
    # legend = :bottomright,
    smooth = true
)
println(
    "slope:",
    round(wavelenthslope(L .* m, d .* yₘ)*1e9, digits=2),
    "nm"
)
