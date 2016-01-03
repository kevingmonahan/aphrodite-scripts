#!/bin/bash
#example: $ atac-run.sh name (eg "name".R1.fastq.gz)
#to resume a later step, specify a step number after the fastq-name: $ atac-run.sh name step-number
#step 1: preprocess reads
#step 2: align reads
#step 3: postprocess reads
#step 4: 
step=${2-1}
if [ "$step" -gt 1 ]
then
	echo "Resuming at step $step"
fi
if [ "$step" -lt 2 ] 
then
    /home/kevin/scripts/atac-fastq-preprocess.sh $1
fi 
if [ "$step" -lt 3 ] 
then
    /home/kevin/scripts/atac-bowtie2.sh $1
fi
if [ "$step" -lt 4 ] 
then
    /home/kevin/scripts/atac-postprocess.sh $1
fi
if [ "$step" -lt 5 ] 
then
	/home/kevin/scripts/atac-homer.sh $1
fi
