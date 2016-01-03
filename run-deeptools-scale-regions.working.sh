#!/bin/bash
#$1=bigwig file with path
#$2=bigwig data name
#$3=size of region
#$4=size of flanking region
#$5=bin size
#$6=bed file with path
#$7=bed file name
computeMatrix scale-regions \
-S $1 \
-R $6 \
--regionBodyLength $3 \
--beforeRegionStartLength $4 \
--afterRegionStartLength $4 \
--missingDataAsZero \
--binSize $5 \
-out matrix.$7.$2.bin-$5.mat

heatmapper --matrixFile matrix.$7.$2.bin-$5.mat \
--sortUsing mean \
--yAxisLabel "coverage" \
--regionsLabel $7 \
--yMin 0 --yMax 1 \
--plotTitle $2 --refPointLabel "TSS" \
--outFileSortedRegions deeptools.$7.$2.bin-$5.sort-mean.bed \
--outFileName heatmap.$7.$2.bin-$5.sort-mean.pdf
