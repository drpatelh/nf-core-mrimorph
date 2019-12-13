FROM nfcore/base:dev
LABEL authors="Harshil Patel" \
      description="Docker image containing all software requirements for the nf-core/mrimorph pipeline"

# Install the conda environment
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-mrimorph-1.0dev/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-mrimorph-1.0dev > nf-core-mrimorph-1.0dev.yml
