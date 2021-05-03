include("ElectricFieldLab.jl")

# define amounts of all point charges
q₁ = 2*10^-9
q₂ = 4*10^-9
q₃ = 6*10^-9
q₄ = 8*10^-9

# Caclulate electric field of each point charge with A
Eaq₁ = ElectricFieldLab.electric_field(q₁, hypot(1,1))
Eaq₂ = ElectricFieldLab.electric_field(q₂, 2)
Eaq₃ = ElectricFieldLab.electric_field(q₃, 3)
Eaq₄ = ElectricFieldLab.electric_field(q₄, hypot(3,3))

# Caclulate electric field of each point charge with B
Ebq₁ = ElectricFieldLab.electric_field(q₁, sqrt(13))
Ebq₂ = ElectricFieldLab.electric_field(q₂, sqrt(5))
Ebq₃ = ElectricFieldLab.electric_field(q₃, sqrt(2))
Ebq₄ = ElectricFieldLab.electric_field(q₄, sqrt(5))

# Find the X-Component of each electric field
Eaq₁x = Eaq₁*cos(atan(1,1))  # A
Eaq₂x = Eaq₂*cos(atan(0,2))  # A
Eaq₃x = Eaq₃*cos(atan(3,0))  # A
Eaq₄x = Eaq₄*cos(atan(3,3))  # A

Ebq₁x = Ebq₁*cos(atan(3,2))  # B
Ebq₂x = Ebq₂*cos(atan(2,1))  # B
Ebq₃x = Ebq₃*cos(atan(1,1))  # B
Ebq₄x = Ebq₄*cos(atan(1,2))  # B

## Find the Y-Component of each electric field
Eaq₁y = Eaq₁*sin(atan(1,1))  # A
Eaq₂y = Eaq₂ *sin(atan(0,2)) # A
Eaq₃y = Eaq₃*sin(atan(3,0))  # A
Eaq₄y = Eaq₄*sin(atan(3,3))  # A

Ebq₁y = Ebq₁*sin(atan(3,2))  # B
Ebq₂y = Ebq₂*sin(atan(2,1))  # B
Ebq₃y = Ebq₃*sin(atan(1,1))  # B
Ebq₄y = Ebq₄*sin(atan(1,2))  # B

# Get the sum total of X & Y components,
# taking into account direction of charges
# A
Eax = - Eaq₁x - Eaq₂x + Eaq₃x - Eaq₄x
Eay = Eaq₁y + Eaq₂y - Eaq₃y + Eaq₄y
# B
Ebx = - Ebq₁x - Ebq₂x - Ebq₃x - Ebq₄x
Eby = Ebq₁y - Ebq₂y - Ebq₃y + Ebq₄y

# Finally, find magnitude (hypotenuse) and 
# direction using X & Y components
@show Ea = hypot(Eax, Eay)
@show Eb = hypot(Ebx, Eby)

@show θa = 180 + rad2deg(atan(Eay/Eax))
@show θb = 180 + rad2deg(atan(Eby/Ebx));