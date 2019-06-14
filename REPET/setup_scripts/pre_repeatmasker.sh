for genome in $(ls /bigdata/stajichlab/shared/projects/MycoMeth/REPET/runs/*/*.fa | grep -v _nt | grep -v cDNA); do ln -s $genome .; done
