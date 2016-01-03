#!/bin/bash
echo "Postprocessing aligned data..."
echo "samtools merge -f $1.bam $1.Aligned.sortedByCoord.out.bam $1.single.Aligned.sortedByCoord.out.bam"
samtools merge -f $1.merged.bam $1.Aligned.sortedByCoord.out.bam $1.single.Aligned.sortedByCoord.out.bam
echo "samtools index $1.merged.bam"
samtools index $1.merged.bam
java -jar /seq/picard/dist/picard.jar MarkDuplicates INPUT=$1.merged.bam OUTPUT=$1.merged.mkdup.bam METRICS_FILE=$1.merged.markdup-metrics.txt
# Leavin duplicates in.
# samtools view -bF 1024 $1.merged.mkdup.bam > $1.merged.rmd.bam
samtools view -bq 30 $1.merged.mkdup.bam -o $1.merged.q30.bam
samtools index $1.merged.q30.bam
bam2wig.py -i $1.merged.q30.bam -s /seq/mm9/mm9.chrom.sizes -t 100000000 -o $1.merged.q30.rnaseq
