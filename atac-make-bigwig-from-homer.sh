#!/bin/bash
makeUCSCfile homer.$1 -o $1.ends.bigWig -bigWig /seq/mm9/mm9.chrom.sizes -fsize 1e20 -fragLength 1 -adjust 4 > $1.ends.bigWig.trackInfo.txt
makeUCSCfile homer.$1 -o $1.ends-5bp.bigWig -bigWig /seq/mm9/mm9.chrom.sizes -fsize 1e20 -fragLength 5 -adjust 4 > $1.ends-5bp.bigWig.trackInfo.txt
makeUCSCfile homer.$1 -o $1.pileup.bigWig -bigWig /seq/mm9/mm9.chrom.sizes -fsize 1e20 -fragLength given -adjust 4 > $1.pileup.bigWig.trackInfo.txt
cp $1.ends.bigWig /mnt/icarus2/ftp/ucsc/kevin/mm9/
cp $1.ends-5bp.bigWig /mnt/icarus2/ftp/ucsc/kevin/mm9/
cp $1.pileup.bigWig /mnt/icarus2/ftp/ucsc/kevin/mm9/
