FROM julia:1.10.4@sha256:797606769b77fa69e23dbb9cba67b0850f5a5b6a901d58b96be5f400d3313b19 as julia
FROM python:3.12.4-slim@sha256:ee6864930c0ec126965614ca3da44ddbd2805b692605fdbfcf28d5f6b463fb3b

# Julia config
ENV JULIA_CI 'true'
ENV JULIA_NUM_THREADS 'auto'
# Let PythonCall use built-in python
ENV JULIA_CONDAPKG_BACKEND 'Null'
ENV JULIA_PATH '/usr/local/julia/'
ENV JULIA_DEPOT_PATH '/srv/juliapkg/'
ENV PATH ${JULIA_PATH}/bin:${PATH}
COPY --from=julia ${JULIA_PATH} ${JULIA_PATH}

WORKDIR /work

# Python dependencies
RUN pip install --no-cache-dir "nbconvert" "matplotlib<3.9"

# Julia dependencies
COPY Project.toml Manifest.toml ./
RUN julia --color=yes -e 'using Pkg; Pkg.add(["IJulia"]); import IJulia; IJulia.installkernel("Julia", "--project=@."); Pkg.activate("."); Pkg.instantiate(); Pkg.precompile()'
