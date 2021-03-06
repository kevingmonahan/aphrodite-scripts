#!/bin/bash
#$1=bigwig file with path
#$2=bigwig data name
#$3=size of region
#$4=size of flanking region
#$5=bin size
#$6=sorted bed file without extension
computeMatrix scale-regions \
-S $1 \
-R $6.bed \
--regionBodyLength $3 \
--beforeRegionStartLength $4 \
--afterRegionStartLength $4 \
--missingDataAsZero \
--binSize $5 \
-out matrix.presort.$6.$2.bin-$5.mat

heatmapper --matrixFile matrix.presort.$6.$2.bin-$5.mat \
--sortRegions no \
--yAxisLabel "coverage" \
--regionsLabel $6 \
--plotTitle $2 --refPointLabel "TSS" \
--yMin 0 \
--outFileName heatmap.presortBy.$6.$2.bin-$5.ymax-10.pdf
