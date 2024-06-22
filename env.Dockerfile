FROM julia:1.10.4@sha256:91f29f6731ddc40d76c97a13ae86ae121df4c7ec8adbf976ce60df94c767cfd0 as julia
FROM python:3.12.4-slim@sha256:2fba8e70a87bcc9f6edd20dda0a1d4adb32046d2acbca7361bc61da5a106a914

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
