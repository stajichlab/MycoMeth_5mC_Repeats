#!/usr/bin/bash
#SBATCH --mem 2G --ntasks 1

module load RepeatMasker

 perl /opt/linux/centos/7.x/x86_64/pkgs/RepeatMasker/4-0-7/util/queryRepeatDatabase.pl -species fungi -clade > fungi.lib
