#!/bin/bash
echo "Running cuffquant..."
echo "cuffquant /seq/mm9/iGenome/Annotation/Archives/archive-2014-05-23-16-05-24/Genes/genes.gtf $1.q30.bam  --library-type fr-secondstrand -o cuffquant.genes-gtf.$1.q30"
cuffquant /seq/mm9/iGenome/Annotation/Archives/archive-2014-05-23-16-05-24/Genes/genes.gtf $1.merged.q30.bam  --library-type fr-secondstrand -o cuffquant.genes-gtf.$1.q30
