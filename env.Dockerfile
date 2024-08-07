FROM julia:1.10.4 as julia
FROM python:3.12.5-slim

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
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Julia dependencies
COPY Project.toml Manifest.toml ./
RUN julia --color=yes -e 'using Pkg; Pkg.add(["IJulia", "Literate", "PrettyTables", "JSON"]); Pkg.activate("."); Pkg.instantiate(); Pkg.precompile()'
