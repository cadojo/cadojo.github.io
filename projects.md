@def title = "Projects"
@def hascode = true
@def tags = ["interests", "academics", "personal", "projects"]

# {{title}}
_What I'm working on in free time!_

## [Exploring Control Theory](https://jcarpinelli.dev/exploring-control-theory.jl/stable)

I'm writing a public note-set which walks through content typically taught in 
a Linear Systems course, through content taught in Linear and Nonlinear Controls
Analysis courses. This note-set uses Julia's 
[_Documenter.jl_](https://github.com/JuliaDocs/Documenter.jl) package to generate 
and serve the note-set content. Along the way, one example system will be analyzed
to reinforce the concepts presented: an approximate 
[polynomial model](https://github/cadojo/PolynomialGTM.jl) for a NASA-developed
sub-scale model aircraft. These notes are also introduced in a [blog post](https://jcarpinelli.dev/writing/Controls/introduction-to-controls).


## [GeneralAstrodynamics.jl](https://github.com/cadojo/GeneralAstrodynamics.jl)

At my highest aspiration, this will be a general purpose astrodynamics 
library a là [poliastro](https://github.com/poliastro/poliastro), but
with Julia instead of Python. I initially developed this [Julia](https://julialang.org) 
package alongside my graduate astrodynamics coursework in the 2020-2021 academic year. 
I'm currently using (and building) the functionality in this package
to support [manifold-based](https://github.com/cadojo/Halo-Orbit-Explorations)
interplanetary transfer designs. If you have any questions about usage, or want to help 
out, please don't be shy about filing issues or submitting PRs!

A quick and simple `GeneralAstrodynamics` example is shown below.

```julia:generalastrodynamics_intro
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
```

\fig{output/generalastrodynamics_intro}

## [AstrodynamicalModels.jl](https://github.com/cadojo/AstrodynamicalModels.jl)

Julia has a package called [_ModelingToolkit.jl_](https://github.com/sciml/modelingtoolkit.jl),
which provides a modeling language within the Julia ecosystem -- you can symbolically write 
your system's equations of motion, and _ModelingToolkit.jl_ will autogenerate fast functions
for your dynamics. _ModelingToolkit.jl_ allows you to write your dynamics for __mathematical
accuracy__, and _not_ for __computational efficiency__. It also hooks into 
[_DifferentialEquations.jl_](https://sciml/differentialequations.jl), which is really 
convenient for simulating your model. 

This package, _AstrodynamicalModels.jl_, provides common astrodynamics models 
as `ModelingToolkit.ODESystem` instances. Vector field functions are also provided 
for each model. 

## [PolynomialGTM.jl](https://github.com/cadojo/PolynomialGTM.jl)

NASA has developed a sub-scale model aircraft for flight dynamics and controls research.
Of course, the flight dynamics are highly nonlinear and complicated. Aerodynamic coefficients
are approximated with look-up tables. University researchers (i.e. Chakraborty et al) were 
given access to these aerodynamic coefficient tables, but the data is not publicly available. 
Chakraborty et al [published](https://www.sciencedirect.com/science/article/abs/pii/S0967066110002595)
a paper outlining nonlinear region-of-attraction analysis for approximated low-order polynomial
models for the model aircraft near select flight conditions. I wrote those polynomial 
models in Python as part of a graduate nonlinear controls [course project](https://github.com/cadojo/Replicated-ROA-Analysis),
and I've written the dynamics in Julia as the _PolynomialGTM.jl_ package.

## [ManipulatorKinematics.jl](https://jcarpinelli.dev/404)

This is a soon-to-be open-source Julia package which provides kinematics
handling for serial robotic manipulators. It uses [_Symbolics.jl_](https://github.com/JuliaSymbolics/Symbolics.jl)
to generate MATLAB and C++ implementations for any manipulator's forward kinematics, Jacobian, and Jacobian-dot.

~~~
<mark>
Check back here soon!
</mark>
~~~ 