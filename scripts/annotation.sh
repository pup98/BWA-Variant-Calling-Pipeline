#!/bin/bash

output="/home/test/users/ujjwal/new_project/annotated_files"
db="/home/ngs/Tools/humandb/"
input="/home/test/users/ujjwal/new_project/variant_files"

perl /home/ngs/Tools/annovar/convert2annovar.pl ${input}/sample1.snp.vcf -format vcf4 > ${output}/sample1_anno.vcf4
perl /home/ngs/Tools/annovar/convert2annovar.pl ${input}/sample2.snp.vcf -format vcf4 > ${output}/sample2_anno.vcf4

perl /home/ngs/Tools/annovar/annotate_variation.pl -geneanno ${output}/sample1_anno.vcf4 -buildver hg38 ${db} 
perl /home/ngs/Tools/annovar/annotate_variation.pl -geneanno ${output}/sample2_anno.vcf4 -buildver hg38 ${db} 


echo "Annotation complete"
