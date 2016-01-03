#!/bin/bash
echo "Running fastqc..."
fastqc $1.R1.fastq.gz
fastqc $1.R2.fastq.gz
echo "Running SeqPrep..."
echo "SeqPrep -f $1.R1.fastq.gz -r $1.R2.fastq.gz -1 $1.SP.R1.fastq.gz -2 $1.SP.R2.fastq.gz -A AGATCGGAAGAGCACACGTC -B AGATCGGAAGAGCGTCGTGT"
SeqPrep -f $1.R1.fastq.gz -r $1.R2.fastq.gz -1 $1.SP.R1.fastq.gz -2 $1.SP.R2.fastq.gz -A AGATCGGAAGAGCACACGTC -B AGATCGGAAGAGCGTCGTGT
echo "Running Sickle..."
echo "sickle pe -t sanger -g -f $1.SP.R1.fastq.gz -r $1.SP.R2.fastq.gz -o $1.sickled.SP.R1.fastq.gz -p $1.sickled.SP.R2.fastq.gz -s $1.sickled.SP.single.fastq.gz"
sickle pe -t sanger -g -f $1.SP.R1.fastq.gz -r $1.SP.R2.fastq.gz -o $1.sickled.SP.R1.fastq.gz -p $1.sickled.SP.R2.fastq.gz -s $1.sickled.SP.single.fastq.gz
fastqc $1.sickled.SP.R1.fastq.gz
fastqc $1.sickled.SP.R2.fastq.gz
fastqc $1.sickled.SP.single.fastq.gz