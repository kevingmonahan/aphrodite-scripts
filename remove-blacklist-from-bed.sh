#! /bin/bash
bedtools intersect -a $1.bed -b /seq/mm9/mm9-blacklist.bed -v > $1.rmBL.bed