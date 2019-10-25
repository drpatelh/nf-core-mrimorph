# ![nf-core/mrimorph](docs/images/nf-core-mrimorph_logo.png)

[![Build Status](https://travis-ci.com/nf-core/mrimorph.svg?branch=master)](https://travis-ci.com/nf-core/mrimorph)
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%89%A519.04.0-brightgreen.svg)](https://www.nextflow.io/)

[![Docker](https://img.shields.io/docker/automated/nfcore/mrimorph.svg)](https://hub.docker.com/r/nfcore/mrimorph)

## Introduction

**nfcore/mrimorph** is a bioinformatics pipeline used for the analysis of brain morphometry MRI imaging data.

The pipeline is built using [Nextflow](https://www.nextflow.io), a workflow tool to run tasks across multiple compute infrastructures in a very portable manner. It comes with docker containers making installation trivial and results highly reproducible.

<!-- TODO nf-core: Add a brief overview of what the pipeline does and how it works -->

## Quick Start

i. Install [`nextflow`](https://nf-co.re/usage/installation)

ii. Install one of [`docker`](https://docs.docker.com/engine/installation/) or [`singularity`](https://www.sylabs.io/guides/3.0/user-guide/).

iii. Download the pipeline and test it on a minimal dataset with a single command

```bash
nextflow run nf-core/mrimorph -profile test,<docker/singularity/institute>
```

> Please check [nf-core/configs](https://github.com/nf-core/configs#documentation) to see if a custom config file to run nf-core pipelines already exists for your Institute. If so, you can simply use `-profile institute` in your command. This will enable either `docker` or `singularity` and set the appropriate execution settings for your local compute environment.

iv. Start running your own analysis!

<!-- TODO nf-core: Update the default command above used to run the pipeline -->
```bash
nextflow run nf-core/mrimorph -profile <docker/singularity/institute> --input '*.img'
```

See [usage docs](docs/usage.md) for all of the available options when running the pipeline.

## Documentation

The nf-core/mrimorph pipeline comes with documentation about the pipeline, found in the `docs/` directory:

1. [Installation](https://nf-co.re/usage/installation)
2. Pipeline configuration
    * [Local installation](https://nf-co.re/usage/local_installation)
    * [Adding your own system config](https://nf-co.re/usage/adding_own_config)
3. [Running the pipeline](docs/usage.md)
4. [Output and how to interpret the results](docs/output.md)
5. [Troubleshooting](https://nf-co.re/usage/troubleshooting)

## Credits

The pipeline was originally written by [The Bioinformatics & Biostatistics Group](https://www.crick.ac.uk/research/science-technology-platforms/bioinformatics-and-biostatistics/) in collaboration with [Jonny Kohl](https://www.crick.ac.uk/research/labs/johannes-kohl), [Patty Wai](mailto:patty.wai@crick.ac.uk) and [Bernard Siow](https://www.crick.ac.uk/research/find-a-researcher/bernard-siow) from [The Francis Crick Institute](https://www.crick.ac.uk/), London and [Ma Da](mailto:da_ma@sfu.ca) from [Simon Fraser University](https://www.sfu.ca/), British Columbia, Canada.

The pipeline was developed by [Harshil Patel](mailto:harshil.patel@crick.ac.uk).

## Contributions and Support

If you would like to contribute to this pipeline, please see the [contributing guidelines](.github/CONTRIBUTING.md).

For further information or help, don't hesitate to get in touch on [Slack](https://nfcore.slack.com/channels/nf-core/mrimorph) (you can join with [this invite](https://nf-co.re/join/slack)).

## Citation

<!-- TODO nf-core: Add citation for pipeline after first release. Uncomment lines below and update Zenodo doi. -->
<!-- If you use  nf-core/mrimorph for your analysis, please cite it using the following doi: [10.5281/zenodo.XXXXXX](https://doi.org/10.5281/zenodo.XXXXXX) -->

You can cite the `nf-core` pre-print as follows:  
Ewels PA, Peltzer A, Fillinger S, Alneberg JA, Patel H, Wilm A, Garcia MU, Di Tommaso P, Nahnsen S. **nf-core: Community curated bioinformatics pipelines**. *bioRxiv*. 2019. p. 610741. [doi: 10.1101/610741](https://www.biorxiv.org/content/10.1101/610741v1).
