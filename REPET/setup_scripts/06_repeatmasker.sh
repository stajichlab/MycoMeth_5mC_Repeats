#!/usr/bin/bash
#SBATCH --ntasks 8 --nodes 1 --mem 8G --time 1-0:0:0 --out RM.%A_%a.out

module load RepeatMasker
DIR=$(realpath runs)
RMLIBPATH=$(realpath final_libraries)
CPUS=$SLURM_CPUS_ON_NODE
if [ ! $CPUS ]; then
 CPUS=2
fi
N=${SLURM_ARRAY_TASK_ID}
if [ ! $N ]; then
 N=$1
fi
if [ ! $N ]; then
 N=1
fi

subdir=$(ls $DIR | sed -n ${N}p)
file=$(ls $DIR/$subdir/*.fa | grep -v cDNA | grep -v _nt.fa)
pref=$(basename $file .fa)
echo "$subdir $file $pref"
pushd RepeatMasker
if [ ! -e $pref.fa ]; then
 ln -s $file .
fi
if [ ! -e $RMLIBPATH/$pref.lib ]; then
 echo "cannot find library $pref.lib in $RMLIBPATH"
 exit
fi
ODIR=$pref.RepeatMasker
mkdir -p $ODIR
RepeatMasker -s -lib $RMLIBPATH/$pref.lib -pa $CPUS -e ncbi -dir $ODIR $pref.fa > $pref.RM.log
cd ..
