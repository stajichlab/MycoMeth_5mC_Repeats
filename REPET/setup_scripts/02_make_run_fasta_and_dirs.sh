#!/usr/bin/bash

pushd runs

for file in ../wgbs_genomes/*.fasta; 
do 
 m=$(basename $file .fasta | awk -F\. '{print $1}'); 
 b=$(basename $file)
 #echo $m; 
 if [ ! -d $m ]; then
   echo $m
   mkdir $m 
 fi
 if [ ! -e $m/$b ]; then
  echo $m/$b
  ln -s $file $m/$b
 fi
done
popd
