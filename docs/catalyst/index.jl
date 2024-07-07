
md"""
# Catalyst

Catalyst is a domain specific language (DSL) package for chemical reaction networks. `Catalyst.jl` is based on `ModelingToolkit.jl` for symbolic transformations and model code generation. The generated code can be efficiently solved by `DifferentialEquations.jl`.

See also [Catalyst.jl docs](https://docs.sciml.ai/Catalyst/stable/).

## Runtime environment
"""

using Pkg
Pkg.status()

#---
using InteractiveUtils
InteractiveUtils.versioninfo()
