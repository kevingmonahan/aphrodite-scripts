#!/bin/bash
#$1=bigwig file with path
#$2=bigwig data name
#$3=size of flanking region
#$4=bin size
#$5=input.bed without extension
computeMatrix reference-point --referencePoint center \
-S $1 \
-R $5.bed \
--beforeRegionStartLength $3 \
--afterRegionStartLength $3 \
--missingDataAsZero \
--binSize $4 \
-out matrix.preSort.$5.$2.bin-$4.mat

heatmapper --matrixFile matrix.preSort.$5.$2.bin-$4.mat \
--sortRegions no \
--yAxisLabel "coverage" \
--yMax 8 \
--zMax 10 \
--yMin 0 \
--plotTitle $2 --refPointLabel "Center" \
--outFileName heatmap.preSortBy.$5.Data.$2.bin-$4.preSort.ymax-8.pdf
