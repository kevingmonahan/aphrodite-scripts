#!/bin/bash
echo "processing aligned reads..."
samtools sort $1.unsorted.bam $1.sort
samtools sort $1.unsorted.single.bam $1.single.sort
samtools merge $1.bam $1.sort.bam $1.single.sort.bam  
samtools index $1.bam
java -jar /seq/picard/dist/picard.jar MarkDuplicates INPUT=$1.bam OUTPUT=$1.mkdup.bam METRICS_FILE=$1.markdup-metrics.txt
samtools view -bF 1024 $1.mkdup.bam > $1.rmd.bam
samtools view -bq 30 $1.rmd.bam > $1.rmd.q30.bam
samtools index $1.rmd.q30.bam
samtools view -f66 $1.rmd.q30.bam | cut -f 9 | sed 's/^-//' > $1.rmd.q30.InsertSize.txt
/home/kevin/perl/count_insert_size.pl $1.rmd.q30.InsertSize.txt > $1.rmd.q30.InsertSize.summary.txt
rm $1.rmd.q30.InsertSize.txt
/home/kevin/perl/count_reads_by_chromosome.pl $1.bam