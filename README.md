# BWA-Variant-Calling-Pipeline

### Download and dump the fastq file: sample2: SRR24927860, sample1: SRR24927859

prefetch -v SRAID

fastq-dump --split-3 path/to/.sra_file

or 

fasterq-dump --split-3 SRAID

### Installed seqtk using : sudo apt-get install seqtk and downsample the fasta file (hardware constraints)

seqtk sample -s100 SRR24927859_2.fastq 200000 > sample1_2.fastq
eqtk sample -s100 SRR24927859_1.fastq 200000 > sample1_1.fastq

seqtk sample -s100 SRR24927860_2.fastq 200000 > sample1_2.fastq
/seqtk sample -s100 SRR24927860_1.fastq 200000 > sample1_1.fastq


### fastqc
fastqc -t 2 sample1_1.fastq sample1_2.fastq 


### BWA

* git clone https://github.com/lh3/bwa.git

* cd bwa 

* make


### Allignment metrics

1. 200000 (100.00%) were paired; of these:
    13412 (6.71%) aligned concordantly 0 times
    148273 (74.14%) aligned concordantly exactly 1 time
    38315 (19.16%) aligned concordantly >1 times
    
    13412 pairs aligned concordantly 0 times; of these:
      5052 (37.67%) aligned discordantly 1 time
    
    8360 pairs aligned 0 times concordantly or discordantly; of these:
      16720 mates make up the pairs; of these:
        7342 (43.91%) aligned 0 times
        5641 (33.74%) aligned exactly 1 time
        3737 (22.35%) aligned >1 times
98.16% overall alignment rate

2.  200000 reads; of these:
   200000 (100.00%) were paired; of these:
    9404 (4.70%) aligned concordantly 0 times
    152573 (76.29%) aligned concordantly exactly 1 time
    38023 (19.01%) aligned concordantly >1 times
    
    9404 pairs aligned concordantly 0 times; of these:
      4207 (44.74%) aligned discordantly 1 time
  
    5197 pairs aligned 0 times concordantly or discordantly; of these:
      10394 mates make up the pairs; of these:
        4513 (43.42%) aligned 0 times
        3022 (29.07%) aligned exactly 1 time
        2859 (27.51%) aligned >1 times
98.87% overall alignment rate


### Samtools view, sort and mpileup


### Varscan variant calling

1. sample1: snp

Min coverage:	10
Min reads2:	4
Min var freq:	0.2
Min avg qual:	0
P-value thresh:	0.99
Reading input from /home/test/users/ujjwal/new_project/output_files/sample1.mpileup.bam
31515299 bases in pileup file
23 variant positions (23 SNP, 0 indel)
0 were failed by the strand-filter
23 variant positions reported (23 SNP, 0 indel)

2. sample2: snp

Only SNPs will be reported
Min coverage:	10
Min reads2:	4
Min var freq:	0.2
Min avg qual:	0
P-value thresh:	0.99
Reading input from /home/test/users/ujjwal/new_project/output_files/sample2.mpileup.bam
32044128 bases in pileup file
12 variant positions (11 SNP, 1 indel)
0 were failed by the strand-filter

11 variant positions reported (11 SNP, 0 indel)

3. sample1: indel

Only indels will be reported
Min coverage:	10
Min reads2:	4
Min var freq:	0.2
Min avg qual:	0
P-value thresh:	0.99
Reading input from /home/test/users/ujjwal/new_project/output_files/sample1.mpileup.bam
31515299 bases in pileup file
23 variant positions (23 SNP, 0 indel)
0 were failed by the strand-filter
0 variant positions reported (0 SNP, 0 indel)

4. sample2: indel

Only indels will be reported
Min coverage:	10
Min reads2:	4
Min var freq:	0.2
Min avg qual:	0
P-value thresh:	0.99
Reading input from /home/test/users/ujjwal/new_project/output_files/sample2.mpileup.bam
32044128 bases in pileup file
12 variant positions (11 SNP, 1 indel)
0 were failed by the strand-filter
1 variant positions reported (0 SNP, 1 indel)

### Find common variants using awk scripting

### Anotate variants using annovar (convert2annovar.pl and annotate_variation.pl)



Note: 
1. All the used executable commands for the tools expcept annovar and BWA are in bashrc. Therefore, full path is provided in script to run BWA and annovar respectively, others are run by the name of tool. 

2. Output sam and bam files were very large so, I have not uploaded them here in github, altough directory structure has been retained for ease of reference 

3. BWA was installed in the BWA directory, since it is already a git initialized folder ... I have not uploaded it. Though, directory structure has been retained for ease of reference. 

4. Link to download the reference is given in get_data.sh script
