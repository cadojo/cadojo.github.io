# This file was generated, do not modify it. # hide
using Plots
using Unitful
using GeneralAstrodynamics

orbit = let
    e = 0.25
    a = 10_000u"km"
    i = 45u"°"
    Ω = 0u"°"
    ω = 0u"°"
    ν = 0u"°"

    Orbit(e, a, i, Ω, ω, ν, Earth) |> CartesianOrbit
end

trajectory = propagate(orbit, period(orbit))

plotpositions(trajectory)
savefig(joinpath(@OUTPUT, "generalastrodynamics_intro.png")) #hide