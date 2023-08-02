#!/bin/bash

wget -P ~/home/test/users/ujjwal/Basesolve/hg38/ http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
gunzip /home/test/users/ujjwal/Basesolve/hg38/hg38.fa.gz

samtools faidx /home/test/users/ujjwal/Basesolve/hg38/hg38.fa

