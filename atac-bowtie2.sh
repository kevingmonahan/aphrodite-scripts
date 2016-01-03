#!/bin/bash
echo "aligning reads with bowtie2..."
bowtie2 -p 10 -X 2000 -x /seq/mm9/indexes/bowtie2_base-index/mm9 -1 $1.sickled.SP.R1.fastq.gz -2 $1.sickled.SP.R2.fastq.gz | samtools view -bS - > $1.unsorted.bam
bowtie2 -p 10 -x /seq/mm9/indexes/bowtie2_base-index/mm9 -U $1.sickled.SP.single.fastq.gz | samtools view -bS - > $1.unsorted.single.bam
