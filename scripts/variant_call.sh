
#!/bin/bash

start=$SECONDS

ref="/home/test/users/ujjwal/new_project/hg38/hg38.fa"
reads="/home/test/users/ujjwal/new_project/data"
output="/home/test/users/ujjwal/new_project/output_files"
variant="/home/test/users/ujjwal/new_project/variant_files"

# Alignment

/home/test/users/ujjwal/new_project/bwa/bwa index ${ref}

# sample 1
/home/test/users/ujjwal/new_project/bwa/bwa mem ${ref} ${reads}/sample1_1.fastq ${reads}/sample1_2.fastq > ${output}/sample1.sam
# sample 2
/home/test/users/ujjwal/new_project/bwa/bwa mem ${ref} ${reads}/sample2_1.fastq ${reads}/sample2_2.fastq > ${output}/sample2.sam

# conver to bam
samtools view ${output}/sample1.sam -o ${output}/sample1.bam
samtools view ${output}/sample2.sam -o ${output}/sample2.bam

samtools sort ${output}/sample1.bam -o ${output}/sample1.sorted.bam
samtools sort ${output}/sample2.bam -o ${output}/sample2.sorted.bam

# picard
java -jar /home/test/users/ujjwal/picard/picard.jar MarkDuplicates I=${output}/sample1.sorted.bam O=${output}/sample1_marked_duplicates.bam M=${output}/sample1_marked_dup_metrics.txt
java -jar /home/test/users/ujjwal/picard/picard.jar MarkDuplicates I=${output}/sample2.sorted.bam O=${output}/sample2_marked_duplicates.bam M=${output}/sample2_marked_dup_metrics.txt

# mpileup file for varscan input
samtools mpileup -B -q 1 -f ${ref} ${output}/sample1.sorted.bam > ${output}/sample1.mpileup.bam
samtools mpileup -B -q 1 -f ${ref} ${output}/sample2.sorted.bam > ${output}/sample2.mpileup.bam

# calling variant using varscan
varscan mpileup2snp ${output}/sample1.mpileup.bam --min-coverage 10 --min-reads2 4 --min-var-freq 0.20 --output-vcf 1 --strand-filter 0 --min-avg-qual 0 --p-value 0.99 > ${variant}/sample1.snp.vcf
varscan mpileup2snp ${output}/sample2.mpileup.bam --min-coverage 10 --min-reads2 4 --min-var-freq 0.20 --output-vcf 1 --strand-filter 0 --min-avg-qual 0 --p-value 0.99 > ${variant}/sample2.snp.vcf

varscan mpileup2indel ${output}/sample1.mpileup.bam --min-coverage 10 --min-reads2 4 --min-var-freq 0.20 --output-vcf 1 --strand-filter 0 --min-avg-qual 0 --p-value 0.99 > ${variant}/sample1.indel.vcf
varscan mpileup2indel ${output}/sample2.mpileup.bam --min-coverage 10 --min-reads2 4 --min-var-freq 0.20 --output-vcf 1 --strand-filter 0 --min-avg-qual 0 --p-value 0.99 > ${variant}/sample2.indel.vcf

# common variants between samples
awk 'NR == FNR {a[$1 $2 $4 $5];next} $1 $2 $4 $5 in a' ${variant}/sample1.snp.vcf ${variant}/sample2.snp.vcf > ${variant}/sample1.sample2.common.snp.vcf
awk 'NR == FNR {a[$1 $2 $4 $5];next} $1 $2 $4 $5 in a' ${variant}/sample1.indel.vcf ${variant}/sample2.indel.vcf > ${variant}/sample1.sample2.common.indel.vcf


end=$SECONDS
timetaken=$(($end-$start))

echo "Elapsed time: $((($timetaken / 60) % 60))min $(($timetaken% 60))sec"
