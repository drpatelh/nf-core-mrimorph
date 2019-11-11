# test-datasets: `nanoseq`

This branch contains test data to be used for automated testing with the [nf-core/nanoseq](https://github.com/nf-core/nanoseq) pipeline.

## Content of this repository

| File	                | Description	                                                                                              |
|-----------------------|-----------------------------------------------------------------------------------------------------------|
| `samplesheet.csv`     | Sample information file                                                                                   |
| `fast5/`              | subset of fast5 files from direct cDNA Nanopore reads for MCF7 (Breast Cancer) cell line                  |
| `reference/`          | Genome reference files (`hg19` UCSC release; cDNA for KCMF1 gene +- 1kb obtained via UCSC Table Browser)  |

## Dataset origin

Fast5 files were obtained from the SG-NEx Project public dataset.

The SG-NEx project was initiated by the Genome Institute of Singapore with the aim to generate reference transcriptomes for 5 of the most commonly used cancer cell lines using Nanopore RNA-Seq data.

[Read more about SG-NEx](https://github.com/GoekeLab/sg-nex-data)

## Reference sequence generation

The test-datasets in this repository were derived from human samples. The size of the entire human genome is too large and possibly too excessive to test the functionality of the pipeline from end-to-end. To overcome this, the data was initially mapped to the human genome and after visual inspecition of the alignments a single gene (i.e. KCMF1) was chosen to represent the reference.

> NB: The [UCSC Genome Browser](https://genome.ucsc.edu) and other methods can also be used to obtain the gene interval or the DNA sequence directly. The approach outlined below is more flexible for instances where the reference genome isnt hosted on UCSC or for custom interval sets.

### Creating a BED file of gene intervals

The interval for KCMF1 was obtained by:
* loading the "hg19" genome in [IGV](http://software.broadinstitute.org/software/igv/)
* searching for "KCMF1" in the search box
* right-clicking on the gene interval in the "RefSeq Genes" track and selecting "Copy Details To Clipboard"

The output of this should look like:
```bash
chr2:85198231-85286595

KCMF1
chr2:85198231-85286595
id = NM_020122
```

This information was reformatted in order to create a [BED](https://genome.ucsc.edu/FAQ/FAQformat.html#format1) file called `hg19_KCMF1.bed`.

```bash
chr2	85198230	85286595	KCMF1	0	+
```

> NB: The BED format uses a 0-based coordinate system so the start position has been adjusted accordingly.

### Generate chromosome sizes file for genome

We need to use [BEDTools](https://github.com/arq5x/bedtools2/) to extract the DNA sequence for KCMF1 from the hg19 reference. First, you will need to create a file that represents the sizes of all the chromosomes in the genome using [SAMtools](https://sourceforge.net/projects/samtools/files/samtools/):

```bash
samtools faidx hg19.fa
cut -f 1,2 hg19.fa.fai > hg19.sizes
```

### Extend the upstream/downstream regions around KCMF1

Now we have the interval for KCMF1 in BED format we can simply use BEDTools to extend this by 1kb both upstream and downstream.

```bash
bedtools slop -i hg19_KCMF1.bed -g hg19.sizes -b 1000 > hg19_KCMF1.slop_1kb.bed
```

This should create a file with the following contents:
```bash
chr2	85197230	85287595	KCMF1	0	+
```

### Extract DNA sequence from reference

Finally, we can use BEDTools again to extract the DNA sequence for the KCMF1 gene from the reference genome:

```bash
bedtools getfasta -name -fi ~/working/genome/hg19/hg19.fa -bed hg19_KCMF1.slop_1kb.bed > hg19_KCMF1.fa
```

### Sample information

The data is not barcoded.

|     	                |         	  |
|-----------------------|-------------|
| Flow Cell       	    | FLO-MIN106	|
| Kit	                  | SQK-DCS108	|
| Barcode Kit	          | None    	  |
