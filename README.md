# RNA-seq analysis
# Dockerfile
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



# process.sh
This Bash script performs a complete RNA sequence analysis pipeline using various tools and R packages. It includes the following steps:
### Prerequisites
- Ensure that the required software and dependencies are installed on your system, including HISAT2, StringTie, SAMtools, and R.
### Usage
1、Clone or download the repository containing the Bash script.  
2、Place the necessary input files in the appropriate directories according to the script's instructions.  
3、Open a terminal and navigate to the directory where the script is located.  
4、Run the script using the command: ​```bash process.sh​```.  
5、The script will execute the following steps:
#### Read Alignment
- The script starts by aligning the reads using HISAT2.
- The genome index is built using ​hisat2-build​.
- Multiple samples are aligned using ​hisat2​ with paired-end reads.
- The resulting alignment files are in SAM format.
#### Conversion and Sorting
- The script converts the SAM files to BAM format using ​samtools sort​.
#### Transcript Assembly and Quantification
- StringTie is used to assemble and quantify transcripts for each sample.
- The script runs ​stringtie​ on each BAM file to generate GTF files.
#### Differential Expression Analysis
- The script performs differential expression analysis using the ballgown package in R.
- The phenotypic data is read from a CSV file.
- The ballgown object is created using ​ballgown()​ with the provided data.
- Statistical tests are performed using ​stattest()​ to identify differentially expressed transcripts and genes.
- Results are written to CSV files (​chrX_transcript_results.csv​ and ​chrX_gene_results.csv​).
- Significant results are subsetted and displayed.
#### Visualization
- The script uses R packages to visualize the results.
- Boxplots of log-transformed FPKM values are generated using ​boxplot()​.
- Transcript visualization is performed using ​plotTranscripts()​.
