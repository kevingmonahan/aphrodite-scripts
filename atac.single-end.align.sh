#!/bin/bash
echo "Running Bowtie2..."
echo "bowtie2 -p 20 -x /seq/mm9/indexes/bowtie2_base-index/mm9 -U $1.ca.sickled.fastq.gz | samtools view -bS - > $1.unsorted.bam"
bowtie2 -p 20 -x /seq/mm9/indexes/bowtie2_base-index/mm9 -U $1.ca.sickled.fastq.gz | samtools view -bS - > $1.unsorted.bam
