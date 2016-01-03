#!/bin/bash
for fastq in $(ls *.fastq.gz); do
    fastqc $fastq
done
