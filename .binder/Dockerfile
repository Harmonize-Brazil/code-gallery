# Lightweight micromamba base image
FROM mambaorg/micromamba:1.5.1-focal

USER root

# Install system libraries (lightweight GDAL, PROJ, GEOS, NetCDF, HDF5)
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        gdal-bin \
        libgdal-dev \
        proj-bin \
        libproj-dev \
        libgeos-dev \
        libspatialindex-dev \
        libhdf5-dev \
        libnetcdf-dev \
        build-essential \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy Binder configuration files into the image
COPY .binder/environment.yml /tmp/environment.yml
COPY .binder/postBuild /tmp/postBuild

# Use micromamba to create the environment from YAML
RUN micromamba env create -f /tmp/environment.yml -y && \
    micromamba clean --all --yes

# Activate environment by default
ENV MAMBA_DEFAULT_ENV=cube4health-binder
ENV PATH=/opt/conda/envs/cube4health-binder/bin:$PATH

# Run postBuild commands
RUN chmod +x /tmp/postBuild && /tmp/postBuild

USER $MAMBA_USER

