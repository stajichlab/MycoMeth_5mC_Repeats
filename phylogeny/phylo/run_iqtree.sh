#!/usr/bin/bash
#SBATCH --nodes 1 --ntasks 16 -p intel --time 5-0:0:0  --mem 24G

module load IQ-TREE

iqtree-omp -s  all_42.JGI_1086.denovocds.fasaln -bb 1000 -nt AUTO -spp  all_42.JGI_1086.denovocds.partitions.txt -bsam GENE -st CODON
