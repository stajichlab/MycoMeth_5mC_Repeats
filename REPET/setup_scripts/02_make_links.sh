#!/usr/bin/bash

for dir in *;  
do 
 pushd $dir; 
 if [ ! -e RepBase_REPET_nt.fa ]; then
  ln -s ../../REPET-slurm/TEdenovo/TEdenovo*.sh .
  ln -s  /srv/projects/db/REPET/RepBase_REPET_nt.fa .
  ln -s /srv/projects/db/REPET/RepBase_REPET_aa.faa .
  ln -s /srv/projects/db/REPET/REPET_Pfam.hmm .
  ln -s /srv/projects/db/REPET/CURRENT/rDNA.fsa .
  f=$(ls *.fasta)
  m=$(echo $f | awk -F_ '{print $1}')
  ln -s $f $m.fa
  pwd=$(pwd)
  cp ../../TEdenovo.cfg .
  cp ../../config.txt .
  chmod 400 TEdenovo.cfg
  perl -i -p -e "s#DIR#$pwd#; s/PROJECT/$m/;" TEdenovo.cfg
  perl -i -p -e "s/PROJECTNAME/$m/" config.txt
 fi
 if [ ! -e cDNA.fa ]; then
  file=$(ls *.fasta)
  base=$(basename $file .fasta)
  pre=$(echo $base | awk -F_ '{print $1}')
  echo "$file $base $pre"
  ln -s ../../wgbs_genomes/$pre.cDNA.fa cDNA.fa
 fi
 popd 
done
