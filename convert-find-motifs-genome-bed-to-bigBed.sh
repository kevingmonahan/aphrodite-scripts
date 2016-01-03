#!/bin/bash
cat $1.bed | awk '{OFS="\t"} {print $1,$2,$3,$5,0,$6}' > $1.ucsc.bed
bedSort $1.ucsc.bed $1.ucsc.bed
bedToBigBed $1.ucsc.bed /seq/mm9/mm9.chrom.sizes $1.bb

