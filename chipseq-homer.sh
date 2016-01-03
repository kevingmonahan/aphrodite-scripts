#!/bin/bash
echo "Running Homer..."
makeTagDirectory homer.$1 $1.rmd.q30.bam  -format sam
#findPeaks homer.$1 -o auto -style factor
makeUCSCfile homer.$1 -o $1.pileup.bigwig -bigWig /seq/mm9/mm9.chrom.sizes -fsize 1e20 -fragLength auto > $1.pileup.bigWig.trackInfo.txt
cp $1.pileup.bigwig /mnt/icarus2/ftp/ucsc/kevin/mm9/
rm $1.pileup.bigWig.trackInfo.txt
