#!/bin/bash
echo "Running Homer..."
makeTagDirectory homer.$1 $1.rmd.q30.bam  -format sam
findPeaks homer.$1 -o homer.$1/peaks.auto.txt -style factor
findPeaks homer.$1 -o homer.$1/peaks.150bp.txt -fragLength 150 -size 150 -style factor
makeUCSCfile homer.$1 -o $1.ends.bigWig -bigWig /seq/mm9/mm9.chrom.sizes -fsize 1e20 -fragLength 1 -adjust 4 > $1.ends.bigWig.trackInfo
makeUCSCfile homer.$1 -o $1.ends-5bp.bigWig -bigWig /seq/mm9/mm9.chrom.sizes -fsize 1e20 -fragLength 5 -adjust 4 > $1.ends-5bp.bigWig.trackInfo
makeUCSCfile homer.$1 -o $1.pileup.bigWig -bigWig /seq/mm9/mm9.chrom.sizes -fsize 1e20 -adjust 4 > $1.pileup.bigWig.trackInfo
cat homer.$1/peaks.150bp.txt | sed '/^\#/d' | awk '{OFS=("\t")}{print $2,$3,$4,$1,$8,$5}' > peaks.$1.150bp.bed
cp $1.ends.bigWig /mnt/icarus2/ftp/ucsc/kevin/mm9/
cp $1.ends-5bp.bigWig /mnt/icarus2/ftp/ucsc/kevin/mm9/
cp $1.pileup.bigWig /mnt/icarus2/ftp/ucsc/kevin/mm9/