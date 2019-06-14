#!/usr/bin/bash
#SBATCH --time 1:00:00 --mem 2G --ntasks 1 --cpus 1  --out=GAL.cds.%A_%a.log -J GALcds

module load GAL

cd wgbs_genomes
N=${SLURM_ARRAY_TASK_ID}
if [ ! $N ]; then
 N=$1
fi
if [ ! $N ]; then
 N=1
fi

file=$(ls *.fasta | sed -n ${N}p)
m=$(basename $file .fasta | awk -F_ '{print $1}');
#echo "$file $m"
ls $m*.gff3 $file
gal_CDS_sequence $m*.gff3 $file | perl -p -e "s/>/>$m|/" > $m.cDNA.fa 
