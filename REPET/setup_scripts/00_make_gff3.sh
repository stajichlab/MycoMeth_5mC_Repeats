#!/usr/bin/bash
#SBATCH --mem 2G --ntasks 1 --nodes 1

module load genometools

for file in *.gff
do
 b=$(basename $file .gff) 
 perl -p -e 's/name/gene_id/; s/(transcriptId|proteinId)/transcript_id/;' $file  | grep -v codon > $b.gtf
 gt gtf_to_gff3 $b.gtf > $b.genes.gff3
done
