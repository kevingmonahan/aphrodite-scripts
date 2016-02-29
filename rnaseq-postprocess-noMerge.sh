#!/bin/bash
echo "Postprocessing aligned data..."
samtools index $1.Aligned.sortedByCoord.out.bam
java -jar /seq/picard/dist/picard.jar MarkDuplicates INPUT=$1.Aligned.sortedByCoord.out.bam OUTPUT=$1.mkdup.bam METRICS_FILE=$1.markdup-metrics.txt
samtools view -bq 30 $1.mkdup.bam -o $1.q30.bam
samtools index $1.q30.bam
bam2wig.py -i $1.q30.bam -s /seq/mm9/mm9.chrom.sizes -t 100000000 -o $1.q30.rnaseq -d "1++,1--,2+-,2-+"
rm $1.mkdup.bam


