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

### Marked Duplicates metrics

1. INFO	2023-08-02 12:37:27	MarkDuplicates	Start of doWork freeMemory: 203004320; totalMemory: 209715200; maxMemory: 32178700288
INFO	2023-08-02 12:37:27	MarkDuplicates	Reading input file and constructing read end information.
INFO	2023-08-02 12:37:27	MarkDuplicates	Will retain up to 116589493 data points before spilling to disk.
WARNING	2023-08-02 12:37:28	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR24927859.7689300. Cause: String 'SRR24927859.7689300' did not start with a parsable number.
INFO	2023-08-02 12:37:33	MarkDuplicates	Read 402220 records. 0 pairs never matched.
INFO	2023-08-02 12:37:33	MarkDuplicates	After buildSortedReadEndLists freeMemory: 820722792; totalMemory: 1811939328; maxMemory: 32178700288
INFO	2023-08-02 12:37:33	MarkDuplicates	Will retain up to 1005584384 duplicate indices before spilling to disk.
INFO	2023-08-02 12:37:38	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2023-08-02 12:37:39	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2023-08-02 12:37:39	MarkDuplicates	Sorting list of duplicate records.
INFO	2023-08-02 12:37:39	MarkDuplicates	After generateDuplicateIndexes freeMemory: 5571728976; totalMemory: 13631488000; maxMemory: 32178700288
INFO	2023-08-02 12:37:39	MarkDuplicates	Marking 327 records as duplicates.
INFO	2023-08-02 12:37:39	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2023-08-02 12:37:39	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2023-08-02 12:37:48	MarkDuplicates	Writing complete. Closing input iterator.
INFO	2023-08-02 12:37:48	MarkDuplicates	Duplicate Index cleanup.
INFO	2023-08-02 12:37:48	MarkDuplicates	Getting Memory Stats.
INFO	2023-08-02 12:37:48	MarkDuplicates	Before output close freeMemory: 340882552; totalMemory: 352321536; maxMemory: 32178700288
INFO	2023-08-02 12:37:48	MarkDuplicates	Closed outputs. Getting more Memory Stats.
INFO	2023-08-02 12:37:49	MarkDuplicates	After output close freeMemory: 131765832; totalMemory: 142606336; maxMemory: 32178700288
[Wed Aug 02 12:37:49 IST 2023] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.37 minutes.
Runtime.totalMemory()=142606336

2. INFO	2023-08-02 12:37:50	MarkDuplicates	Start of doWork freeMemory: 203004432; totalMemory: 209715200; maxMemory: 32178700288
INFO	2023-08-02 12:37:50	MarkDuplicates	Reading input file and constructing read end information.
INFO	2023-08-02 12:37:50	MarkDuplicates	Will retain up to 116589493 data points before spilling to disk.
WARNING	2023-08-02 12:37:51	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR24927860.67894. Cause: String 'SRR24927860.67894' did not start with a parsable number.
INFO	2023-08-02 12:37:54	MarkDuplicates	Read 400924 records. 0 pairs never matched.
INFO	2023-08-02 12:37:55	MarkDuplicates	After buildSortedReadEndLists freeMemory: 791229104; totalMemory: 1782579200; maxMemory: 32178700288
INFO	2023-08-02 12:37:55	MarkDuplicates	Will retain up to 1005584384 duplicate indices before spilling to disk.
INFO	2023-08-02 12:38:00	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2023-08-02 12:38:00	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2023-08-02 12:38:00	MarkDuplicates	Sorting list of duplicate records.
INFO	2023-08-02 12:38:01	MarkDuplicates	After generateDuplicateIndexes freeMemory: 5504720816; totalMemory: 13564379136; maxMemory: 32178700288
INFO	2023-08-02 12:38:01	MarkDuplicates	Marking 318 records as duplicates.
INFO	2023-08-02 12:38:01	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2023-08-02 12:38:01	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2023-08-02 12:38:09	MarkDuplicates	Writing complete. Closing input iterator.
INFO	2023-08-02 12:38:09	MarkDuplicates	Duplicate Index cleanup.
INFO	2023-08-02 12:38:09	MarkDuplicates	Getting Memory Stats.
INFO	2023-08-02 12:38:10	MarkDuplicates	Before output close freeMemory: 198310880; totalMemory: 209715200; maxMemory: 32178700288
INFO	2023-08-02 12:38:10	MarkDuplicates	Closed outputs. Getting more Memory Stats.
INFO	2023-08-02 12:38:10	MarkDuplicates	After output close freeMemory: 61397616; totalMemory: 71303168; maxMemory: 32178700288
[Wed Aug 02 12:38:10 IST 2023] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.34 minutes.
Runtime.totalMemory()=71303168



### Allignment metrics

1. M::bwa_idx_load_from_disk] read 0 ALT contigs
[M::process] read 70890 sequences (10000026 bp)...
[M::process] read 70842 sequences (10000237 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (1, 28190, 0, 0)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (149, 209, 287)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 563)
[M::mem_pestat] mean and std.dev: (225.16, 99.79)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 701)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70890 reads in 31.104 CPU sec, 30.980 real sec
[M::process] read 70766 sequences (10000232 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (0, 28277, 0, 0)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (150, 209, 286)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 558)
[M::mem_pestat] mean and std.dev: (224.65, 99.25)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 694)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70842 reads in 27.892 CPU sec, 27.647 real sec
[M::process] read 70806 sequences (10000019 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (0, 28253, 0, 0)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (151, 210, 288)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 562)
[M::mem_pestat] mean and std.dev: (225.52, 99.45)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 699)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70766 reads in 30.540 CPU sec, 30.324 real sec
[M::process] read 70848 sequences (10000085 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (1, 28181, 0, 1)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (150, 210, 288)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 564)
[M::mem_pestat] mean and std.dev: (226.05, 100.23)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 702)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70806 reads in 27.248 CPU sec, 27.050 real sec
[M::process] read 45848 sequences (6472182 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (0, 28240, 0, 2)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (150, 210, 287)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 561)
[M::mem_pestat] mean and std.dev: (224.91, 99.46)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 698)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70848 reads in 29.524 CPU sec, 29.353 real sec
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (0, 18173, 1, 0)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (150, 209, 288)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 564)
[M::mem_pestat] mean and std.dev: (224.79, 99.53)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 702)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 45848 reads in 19.620 CPU sec, 19.520 real sec
[main] Version: 0.7.17-r1198-dirty
[main] CMD: /home/test/users/ujjwal/new_project/bwa/bwa mem hg38.fa ../data/sample1_1.fastq ../data/sample1_2.fastq
[main] Real time: 169.857 sec; CPU: 170.812 sec
98.16% overall alignment rate

2.  [M::bwa_idx_load_from_disk] read 0 ALT contigs
[M::process] read 70976 sequences (10000030 bp)...
[M::process] read 70970 sequences (10000089 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (0, 29128, 1, 0)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (148, 207, 283)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 553)
[M::mem_pestat] mean and std.dev: (222.47, 98.91)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 688)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70976 reads in 23.284 CPU sec, 23.184 real sec
[M::process] read 70990 sequences (10000183 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (1, 29112, 0, 0)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (149, 209, 286)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 560)
[M::mem_pestat] mean and std.dev: (224.40, 99.90)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 697)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70970 reads in 25.868 CPU sec, 25.746 real sec
[M::process] read 70962 sequences (10000126 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (0, 29051, 0, 2)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (149, 207, 285)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 557)
[M::mem_pestat] mean and std.dev: (223.23, 99.26)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 693)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70990 reads in 24.164 CPU sec, 23.962 real sec
[M::process] read 70968 sequences (10000167 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (1, 29106, 1, 3)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (149, 207, 285)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 557)
[M::mem_pestat] mean and std.dev: (223.97, 99.83)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 693)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70962 reads in 23.944 CPU sec, 23.730 real sec
[M::process] read 45134 sequences (6365563 bp)...
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (0, 29027, 0, 1)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (149, 208, 284)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 554)
[M::mem_pestat] mean and std.dev: (222.84, 97.91)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 689)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 70968 reads in 25.452 CPU sec, 25.273 real sec
[M::mem_pestat] # candidate unique pairs for (FF, FR, RF, RR): (1, 18562, 1, 2)
[M::mem_pestat] skip orientation FF as there are not enough pairs
[M::mem_pestat] analyzing insert size distribution for orientation FR...
[M::mem_pestat] (25, 50, 75) percentile: (149, 209, 287)
[M::mem_pestat] low and high boundaries for computing mean and std.dev: (1, 563)
[M::mem_pestat] mean and std.dev: (225.31, 100.66)
[M::mem_pestat] low and high boundaries for proper pairs: (1, 701)
[M::mem_pestat] skip orientation RF as there are not enough pairs
[M::mem_pestat] skip orientation RR as there are not enough pairs
[M::mem_process_seqs] Processed 45134 reads in 15.772 CPU sec, 15.665 real sec
[main] Version: 0.7.17-r1198-dirty
[main] CMD: /home/test/users/ujjwal/new_project/bwa/bwa mem hg38.fa ../data/sample2_1.fastq ../data/sample2_2.fastq
[main] Real time: 142.009 sec; CPU: 142.848 sec
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
