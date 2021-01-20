# orthology search with reciprocal best blast with potato genes in tomato
# download NCBI blast and store in the same directory with the files of reference genomes of interest
# this will ensure to use the command makeblastdb from the package to create database
# Installing BLAST. BLAST 2.9.0 has been already installed in my system previously

cd /Users/ma2292/Documents/cornell/WangLab/orthology/nr/ncbi-blast-2.9.0+/bin
echo "$PATH"

# making local blast database using makeblastdb command

makeblastdb -in St_pep_try.fasta -dbtype prot
makeblastdb -in ITAG4.0_proteins.fasta -dbtype prot

# To get into tabular format (so far the best usable format):

./blastp -query Stuberosum_448_v4.03.protein.fa -db ITAG4.0_proteins.fasta -out potato_tab.fasta -outfmt 6 -evalue 0.001 -max_target_seqs 3 -num_threads 3

./blastp -query ITAG4.0_proteins.fasta -db Stuberosum_448_v4.03.protein.fa  -out tomato_tab.fasta -outfmt 6 -evalue 0.001 -max_target_seqs 1 -num_threads 2


# Or if you want to filter the blast output (already sorted by query name) by identity and e-value

./blastp -query Stuberosum_448_v4.03.protein.fa -db ITAG4.0_proteins.fasta -out potato_tab_best.fasta -evalue 0.001 -qcov_hsp_perc 70 -max_hsps 2 -outfmt 6 -max_target_seqs 1 -num_threads 3   
   
./blastp -query ITAG4.0_proteins.fasta -db Stuberosum_448_v4.03.protein.fa -out tomato_tab_best.fasta -evalue 0.001 -qcov_hsp_perc 70 -max_hsps 2 -outfmt 6 -max_target_seqs 1 -num_threads 3   

# On tomato genome version ITAG 3.2 protein sequences
   
./blastp -query Stuberosum_448_v4.03.protein.fa -db ITAG4.0_proteins.fasta -out potato_tab_best_onITAG_3.2.fasta -evalue 0.001 -qcov_hsp_perc 70 -max_hsps 2 -outfmt 6 -max_target_seqs 1 -num_threads 3   

# running BLAST and restricting the output to e-value of 0.001 with .xml output as xml is the default and if further analysis is required

./blastp -query Stuberosum_448_v4.03.protein.fa -db ITAG4.0_proteins.fasta -out potato_orth.xml -outfmt 5 -evalue 0.001 -max_target_seqs 3 -num_threads 3

./blastp -query ITAG4.0_proteins.fasta -db Stuberosum_448_v4.03.protein.fa  -out tomato_orth.xml -outfmt 5 -evalue 0.001 -max_target_seqs 1 -num_threads 2