for lib in *.fa
do
 b=$(basename $lib _denovoLibTEs_filtered_Blastclust.fa)
 if [ ! -d $b ]; then
  mkdir $b
  rsync -a $lib $b
  pushd $b
  ln -s ../../REPET-slurm/RepeatClassifier/01_classify.sh 
  popd
  echo "CONSENSUS=${b}_denovoLibTEs_filtered_Blastclust.fa" > $b/config.txt
 fi
done
