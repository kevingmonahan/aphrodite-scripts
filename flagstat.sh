#!/bin/bash
echo "flagstat summary" > flagstat.txt
for bam in $(ls *.bam); do
    echo $bam >> flagstat.txt
    samtools flagstat $bam >> flagstat.txt
done
