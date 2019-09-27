#!/usr/bin/bash
pushd RepeatMasker
for genome in $(ls ../runs/*/*.fa | grep -v _nt | grep -v cDNA); do ln -s $genome .; done
