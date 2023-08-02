#!/bin/bash

output="/home/test/users/ujjwal/new_project/annotated_files"
db="/home/ngs/Tools/humandb/"
input="/home/test/users/ujjwal/new_project/variant_files"

perl /home/ngs/Tools/annovar/convert2annovar.pl -format vcf4 ${input}/sample1.snp.vcf > ${output}/sample1.avinput
perl /home/ngs/Tools/annovar/convert2annovar.pl -format vcf4 ${input}/sample2.snp.vcf > ${output}/sample2.avinput

perl /home/ngs/Tools/annovar/annotate_variation.pl -geneanno -buildver hg38 ${output}/sample1.avinput ${db} 
perl /home/ngs/Tools/annovar/annotate_variation.pl -geneanno -buildver hg38 ${output}/sample2.avinput ${db} 


echo "Annotation complete"
