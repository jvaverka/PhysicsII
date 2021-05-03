module ElectricFieldLab

export k, coloumb_force, electric_field

const k = 8.99 * 10^9

coloumb_force(Q, qₚ, r) = k * (Q * qₚ) / r^2
electric_field(Q, r) = k * Q / r^2

end