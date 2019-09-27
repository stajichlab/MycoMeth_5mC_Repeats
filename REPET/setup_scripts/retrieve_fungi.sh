#!/usr/bin/bash
#SBATCH --mem 2G --ntasks 1

module load RepeatMasker
DIR=$(dirname `which RepeatMasker`)/util
perl $DIR/queryRepeatDatabase.pl -species fungi -clade > fungi.lib
