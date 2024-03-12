# Parallelism

## Multiprocessing

[Multi-processing and Distributed Computing](https://docs.julialang.org/en/v1/manual/distributed-computing/) in Julia docs.

### Activate multiprocessing in Julia

Use `addprocs(N)` in the Julia script

```julia
using Distributed

# Add 3 worker processes
addprocs(3)
```

Or start julia with `-p N`:

```bash
julia -p 3
```

### Activate environment in worker processes

+ `@everywhere` runs the code in every process.
+ `Base.current_project()` returns the location of `Project.toml`.

```julia
@everywhere begin
    ENV["GKSwstype"] = "100"
    using Pkg
    Pkg.activate(Base.current_project())
end
```
