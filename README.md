# RNA-seq analysis
## Dockerfile
This Docker image provides a collection of tools used in RNA sequence analysis. It includes the following software:
- HISAT2 2.1.0
- StringTie 2.2.1
- Htslib 1.3.2
- SAMtools 1.3.1
- R programming language with BiocManager packages and ballgown
### Usage
To use this Docker image, you need to have Docker installed on your system. Once Docker is installed, you can follow these steps:
1、Build the Docker image using the provided Dockerfile:
```
docker build -t rna-seq-tools .
```
2、Run a container based on the built image:
```
docker run -it rna-seq-tools
```
3、Inside the container, you will have access to all the installed tools and dependencies.
### Installed Tools
#### HISAT2 2.1.0
HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads to a population of genomes.
#### StringTie 2.2.1
StringTie is a fast and accurate software for transcript assembly and quantification of RNA-Seq data.
#### Htslib 1.3.2
Htslib is a C library for reading/writing high-throughput sequencing data, such as SAM and BAM files.
#### SAMtools 1.3.1
SAMtools is a suite of utilities for manipulating alignments in the SAM/BAM format.
#### R Programming Language with BiocManager Packages and ballgown
This image includes the R programming language along with BiocManager packages, including ballgown for differential expression analysis of RNA-Seq data.
### Contributing
If you find any issues or have suggestions for improvements, please feel free to contribute by opening an issue or submitting a pull request on the GitHub repository.

