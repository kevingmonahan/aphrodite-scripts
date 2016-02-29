#!/bin/bash
echo "Running fastqc..."
echo "fastqc $1.fastq.gz"
fastqc $1.fastq.gz
echo "Running CutAdapt..."
echo "cutadapt -a CTGTCTCTTATACACATCTC -o $1.ca.fastq.gz $1.fastq.gz"
cutadapt -a CTGTCTCTTATACACATCTC -o $1.ca.fastq.gz $1.fastq.gz
echo "Running Sickle..."
echo "sickle se -f $1.ca.fastq.gz -t sanger -o $1.ca.sickled.fastq.gz"
sickle se -g -f $1.ca.fastq.gz -t sanger -o $1.ca.sickled.fastq.gz
echo "Running fastqc on processed reads..."
echo "fastqc $1.ca.sickled.fastq.gz"
fastqc $1.ca.sickled.fastq.gz
rm $1.ca.fastq
