FROM julia:1.10.4@sha256:797606769b77fa69e23dbb9cba67b0850f5a5b6a901d58b96be5f400d3313b19 as julia
FROM python:3.12.3-slim@sha256:afc139a0a640942491ec481ad8dda10f2c5b753f5c969393b12480155fe15a63

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
