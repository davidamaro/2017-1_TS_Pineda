using Base.Test

const RoundNDigits = RoundingMode{:RoundNDigits}()
Base.round(n::Number, digits::Int, ::RoundingMode{:RoundNDigits}) = round(n, -round(Int,floor(log10(abs(n)))) + (digits - 1))

@test round(1.123e12, 1, RoundNDigits) == 1.0e12
@test round(1.123e12, 2, RoundNDigits) == 1.1e12
@test round(1.123e12, 3, RoundNDigits) == 1.12e12
