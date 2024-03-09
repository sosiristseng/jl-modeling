# Modeling in Julia

- [Gens Julia](https://gensjulia.pages.dev/), my Julia resource list adapted from `Julia.jl`.
- [Julia Package Setup Tutorial](https://bjack205.github.io/tutorial/2021/07/16/julia_package_setup.html)
- [Julia packages (JuliaHub)](https://juliahub.com/ui/Packages)
- [Julia discourse forum](https://discourse.julialang.org/)
- [Solving PDEs in parallel on GPUs with Julia](https://pde-on-gpu.vaw.ethz.ch/) : a Julia course
- [Parallel Computing and Scientific Machine Learning (SciML): Methods and Applications](https://book.sciml.ai/)
- [Modern Julia Workflows](https://modernjuliaworkflows.github.io/)

## Package development

- https://github.com/invenia/PkgTemplates.jl : templates to create new Julia packages.
- https://github.com/timholy/Revise.jl : reducing the need to restart when you make changes to code.
- https://github.com/Roger-luo/FromFile.jl : including other files without duplication.
- https://github.com/JuliaDocs/Documenter.jl : generating package documentation.
- https://github.com/wookay/Jive.jl : unit testing in parallel.

## Publishing code examples

- https://github.com/fredrikekre/Literate.jl : converting _literated_ `jl` files to Markdown (`md`) or Jupyter notebooks (`ipynb`).
- https://github.com/stevengj/NBInclude.jl : converting Jupyter notebooks (`ipynb`) to _literated_ `jl` files by using `nbexport("myfile.jl", "myfile.ipynb")`.

## Optimization

- https://github.com/baggepinnen/Hyperopt.jl : Hyperparameter optimization for every cost function with multiprocessing and multithreading support.
- https://github.com/SciML/Optimization.jl : A unified interface for [various optimizers](https://docs.sciml.ai/Optimization/stable/#Overview-of-the-Optimizers)
    - `OptimizationBBO` for black-box optimization from https://github.com/robertfeldt/BlackBoxOptim.jl
    - `OptimizationEvolutionary` for genetic algorithm from https://github.com/wildart/Evolutionary.jl
    - `OptimizationOptimJL` for optimization methods from https://github.com/JuliaNLSolvers/Optim.jl
    - `OptimizationMOI` for optimization methods from https://github.com/jump-dev/MathOptInterface.jl
    - etc.

## Curve fitting

- https://github.com/pjabardo/CurveFit.jl
- https://github.com/JuliaNLSolvers/LsqFit.jl
- https://github.com/SciML/Optimization.jl

## Modeling and simulation

- https://github.com/SciML/DifferentialEquations.jl : solving differential eqautions.
- https://github.com/SciML/ModelingToolkit.jl : a symbolic modeling framework.
  - https://github.com/JuliaSymbolics/Symbolics.jl : a computer algebra system (CAS) for symbolic calculations.
- https://github.com/SciML/Catalyst.jl : a domain-specific language (DSL) for shemical reaction networks.
- https://github.com/JuliaDynamics/Agents.jl : agent-based modeling (ABM).

### Universal differential equations (UDEs)

- https://github.com/SciML/DiffEqFlux.jl : solving differential equations with neural networks.
- https://github.com/SciML/NeuralPDE.jl : Physics-Informed Neural Networks (PINNs).

### Partial differential equations (PDEs)

- https://github.com/SciML/MethodOfLines.jl : finite difference method (FDM).
- https://github.com/Ferrite-FEM/Ferrite.jl : finite element method (FEM).
- https://github.com/gridap/Gridap.jl : grid-based approximation of PDEs with an expressive API.
- https://github.com/trixi-framework/Trixi.jl : hyperbolic PDE solver.
- https://github.com/j-fu/VoronoiFVM.jl : finite volume method (FVM).

### Model analysis

- https://github.com/bifurcationkit/BifurcationKit.jl : bifurcation analysis.
- https://github.com/SciML/DiffEqParamEstim.jl

## Probability and Statistics

- https://github.com/JuliaStats/StatsBase.jl : statistics-related functions.
- https://github.com/JuliaStats/GLM.jl : Generalized linear models (GLMs).

## Handy tools

- https://github.com/JuliaMath/Interpolations.jl : continuous interpolation of discrete datasets.
- https://github.com/SciML/DataInterpolations.jl : A library of data interpolation and smoothing functions.
- https://github.com/korsbo/Latexify.jl : convert julia objects to LaTeX equations.

## Arrays

- https://github.com/JuliaArrays/LazyGrids.jl : multi-dimensional grids.
- https://github.com/SciML/LabelledArrays.jl : a label for each element in a array.
- https://github.com/jonniedie/ComponentArrays.jl : arrays with arbitrarily nested named components.

## Visualization

- https://github.com/JuliaPlots/Plots.jl : a unified interface for various visualization libraries.
- https://github.com/stevengj/PythonPlot.jl : `matplotlib.pyplot` in Julia, using https://github.com/cjdoris/PythonCall.jl for python libraries.
- https://github.com/MakieOrg/Makie.jl : native Julia visualizations with GPU acceleration and an interactive interface.

## Concurrency

- https://github.com/JuliaFolds/Folds.jl : a unified interface for sequential, threaded, and distributed fold.
- https://github.com/tkf/ThreadsX.jl : multithreaded base functions.
