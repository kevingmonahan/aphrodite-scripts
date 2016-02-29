#!/bin/bash
#$1=bigwig file with path
#$2=bigwig data name
#$3=size of flanking region
#$4=bin size
#$5=bed file with path
#$6=bed file name
computeMatrix reference-point --referencePoint center \
-S $1 \
-R $5 \
--beforeRegionStartLength $3 \
--afterRegionStartLength $3 \
--missingDataAsZero \
--binSize $4 \
--numberOfProcessors 10 \
-out matrix.$6.$2.bin-$4.$3.mat

heatmapper --matrixFile matrix.$6.$2.bin-$4.$3.mat \
--sortRegions no \
--yAxisLabel "coverage" \
--plotTitle $2 --refPointLabel "Center" \
--outFileName heatmap.pre-sort-by-$6.$2.bin-$4.size-$3.sort-mean.pdf
