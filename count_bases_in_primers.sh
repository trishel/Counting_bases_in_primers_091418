#!/bin/bash

# script to count the number of bases in a primer
# it expects any number of fasta files as input
# it will be wrong if the last line of sequence info
# does not have a newline character

# expecting a fasta file formatted like this:

# > sequence_id
# AGCTCGTC

# this will get the second line (the bases) in the file
# that's the head piped into the tail
# then count the characters (the wc -m)
# but then also subtract one becasue wc -m counts newlines(linebreaks)!
# sigh.
# Another solution would be to use tr like so
# head -2 primer_B.fasta | tail -1 | tr -d '\n' | wc -m
# what we found in our google search in class:
# expr $(head -n 2 "$@" | tail -1 | wc -m) - 1
for file in "$@"
do
FILENAME=$(basename $file .fasta)
COUNT=$(expr $(head -n 2 $file | tail -1 | wc -m) - 1)
  echo In $FILENAME, there are $COUNT nucleotides  
done
