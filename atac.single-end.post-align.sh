#!/bin/bash
samtools sort $1.unsorted.bam $1
samtools index $1.bam
echo $1.bam >> flagstat.txt
samtools flagstat $1.bam >> flagstat.txt
samtools idxstats $1.bam | cut -f 1 | grep -v chrM | xargs samtools view -b $1.bam > $1.noChrM.bam
java -jar /seq/picard/dist/picard.jar MarkDuplicates INPUT=$1.noChrM.bam OUTPUT=$1.mkdup.bam METRICS_FILE=$1.markdup-metrics.txt
echo $1.mkdup.bam >> flagstat.txt
samtools flagstat $1.mkdup.bam >> flagstat.txt
samtools view -bF 1024 $1.mkdup.bam > $1.rmd.bam
samtools view -bq 30 $1.rmd.bam > $1.rmd.q30.bam
samtools index $1.rmd.q30.bam
echo $1.rmd.q30.bam >> flagstat.txt
samtools flagstat $1.rmd.q30.bam >> flagstat.txt
rm $1.noChrM.bam
rm $1.mkdup.bam
rm $1.rmd.bam
/home/kevin/perl/count_reads_by_chromosome.pl $1.bam
