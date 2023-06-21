#!/bin/bash
# read alignment
cd ./hisat2/hisat2-2.1.0
extract_splice_sites.py chrX_data/genes/chrX.gtf >chrX.ss
extract_exons.py chrX_data/genes/chrX.gtf >chrX.exon
hisat2-build --ss chrX.ss --exon chrX.exon chrX_data/genome/chrX.fa chrX_tran
# create index
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188044_chrX_1.fastq.gz -2 chrX_data/samples/ERR188044_chrX_2.fastq.gz -S ERR188044_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188234_chrX_1.fastq.gz -2 chrX_data/samples/ERR188234_chrX_2.fastq.gz -S ERR188234_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188245_chrX_1.fastq.gz -2 chrX_data/samples/ERR188245_chrX_2.fastq.gz -S ERR188245_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188257_chrX_1.fastq.gz -2 chrX_data/samples/ERR188257_chrX_2.fastq.gz -S ERR188257_chrX.sam
 hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188273_chrX_1.fastq.gz -2 chrX_data/samples/ERR188273_chrX_2.fastq.gz -S ERR188273_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188337_chrX_1.fastq.gz -2 chrX_data/samples/ERR188337_chrX_2.fastq.gz -S ERR188337_chrX.sam
 hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188383_chrX_1.fastq.gz -2 chrX_data/samples/ERR188383_chrX_2.fastq.gz -S ERR188383_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188401_chrX_1.fastq.gz -2 chrX_data/samples/ERR188401_chrX_2.fastq.gz -S ERR188401_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188428_chrX_1.fastq.gz -2 chrX_data/samples/ERR188428_chrX_2.fastq.gz -S ERR188428_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR188454_chrX_1.fastq.gz -2 chrX_data/samples/ERR188454_chrX_2.fastq.gz -S ERR188454_chrX.sam
hisat2 -p 8 --dta -x chrX_data/indexes/chrX_tran -1 chrX_data/samples/ERR204916_chrX_1.fastq.gz -2 chrX_data/samples/ERR204916_chrX_2.fastq.gz -S ERR204916_chrX.sam
# 使用hisat2完成序列比对
samtools sort -@ 8 -o ERR188044_chrX.bam ERR188044_chrX.sam
samtools sort -@ 8 -o ERR188104_chrX.bam ERR188104_chrX.sam
samtools sort -@ 8 -o ERR188234_chrX.bam ERR188234_chrX.sam
samtools sort -@ 8 -o ERR188245_chrX.bam ERR188245_chrX.sam
samtools sort -@ 8 -o ERR188257_chrX.bam ERR188257_chrX.sam
samtools sort -@ 8 -o ERR188273_chrX.bam ERR188273_chrX.sam
samtools sort -@ 8 -o ERR188337_chrX.bam ERR188337_chrX.sam
samtools sort -@ 8 -o ERR188383_chrX.bam ERR188383_chrX.sam
samtools sort -@ 8 -o ERR188401_chrX.bam ERR188401_chrX.sam
samtools sort -@ 8 -o ERR188428_chrX.bam ERR188428_chrX.sam
samtools sort -@ 8 -o ERR188454_chrX.bam ERR188454_chrX.sam
samtools sort -@ 8 -o ERR204916_chrX.bam ERR204916_chrX.sam
#使用samtools将.sam转换为.bam
#Assembly and quantify
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188044_chrX.gtf ERR188044_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188104_chrX.gtf ERR188104_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188234_chrX.gtf ERR188234_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188245_chrX.gtf ERR188245_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188257_chrX.gtf ERR188257_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188273_chrX.gtf ERR188273_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188337_chrX.gtf ERR188337_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188383_chrX.gtf ERR188383_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188401_chrX.gtf ERR188401_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188428_chrX.gtf ERR188428_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR188454_chrX.gtf ERR188454_chrX.bam
stringtie -p 8 -G chrX_data/genes/chrX.gtf -o ERR204916_chrX.gtf ERR204916_chrX.bam
#对每一个样本组装转录本
stringtie --merge -p 8 -G chrX_data/genes/chrX.gtf -o stringtie_merged.gtf chrX_data/mergelist.txt
#merge，获得txt文件中整合了所有的GTF文件名
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188044/ERR188044_chrX.gtf ERR188044_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188104/ERR188104_chrX.gtf ERR188104_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188234/ERR188234_chrX.gtf ERR188234_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188245/ERR188245_chrX.gtf ERR188245_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188257/ERR188257_chrX.gtf ERR188257_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188273/ERR188273_chrX.gtf ERR188273_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188337/ERR188337_chrX.gtf ERR188337_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188383/ERR188383_chrX.gtf ERR188383_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188401/ERR188401_chrX.gtf ERR188401_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188428/ERR188428_chrX.gtf ERR188428_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR188454/ERR188454_chrX.gtf ERR188454_chrX.bam
stringtie -p 8 -G stringtie_merged.gtf -e -B -o ballgown/ERR204916/ERR204916_chrX.gtf ERR204916_chrX.bam 
#使用R语言的ballgown包
#Run the different expression analysis 
R
library(ballgown)
library(RSkittleBrewer)
library(genefilter)
library(dplyr)
library(devtools)
#加载R包
pheno_data = read.csv("geuvadis_phenodata.csv")
bg_chrX = ballgown(dataDir = "ballgown", samplePattern = "ERR", pData=pheno_data)
#读取String Tie数据
bg_chrX_filt = subset(bg_chrX,"rowVars(texpr(bg_chrX)) >1",genomesubset=TRUE)
results_transcripts = stattest(bg_chrX_filt, feature="transcript",covariate="sex",adjustvars = c("population"), getFC=TRUE, meas="FPKM")
results_genes = stattest(bg_chrX_filt, feature="gene", covariate="sex", adjustvars = c("population"), getFC=TRUE, meas="FPKM")
results_transcripts = data.frame(geneNames=ballgown::geneNames(bg_chrX_filt),geneIDs=
ballgown::geneIDs(bg_chrX_filt), results_transcripts)
results_transcripts = arrange(results_transcripts,pval)
results_genes = arrange(results_genes,pval)
#查看组间有统计显著差异的转录本和基因
write.csv(results_transcripts, "chrX_transcript_results.csv", row.names=FALSE)
write.csv(results_genes, "chrX_gene_results.csv", row.names=FALSE)
#结果写入csv文件
subset(results_transcripts,results_transcripts$qval<0.05)
subset(results_genes,results_genes$qval<0.05)
tropical= c('darkorange', 'dodgerblue', 'hotpink', 'limegreen', 'yellow')
palette(tropical)
fpkm = texpr(bg_chrX,meas="FPKM") 
fpkm = log2(fpkm+1)
boxplot(fpkm,col=as.numeric(pheno_data$sex),las=2,ylab='log2(FPKM+1)')
plotTranscripts(ballgown::geneIDs(bg_chrX)[2000],bg_chrX,main=c('Gene XIST in sample ERR188234'),sample=c('ERR188234'))
#结果可视化
