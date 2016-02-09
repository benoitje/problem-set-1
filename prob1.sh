
#! /usr/bin/env bash

datasets='/Users/jeanne/desktop/molb7621/data-sets'

# Which state has the lowest murder rate?

states="$datasets/states.tab.gz"

answer_1=$(gzcat $states \
	| grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head -1 \
    | cut -f1 \
    | sed 's/"//g')
    echo "answer-1:$answer_1"
 echo "answer-1:$answer_1"> answers.yml

 #How many sequence records are in the sample.fa file?

 samplefa="$datasets/sample.fa"

 answer_2=:$(cat $samplefa \
            | grep -c '>' \
            | sed 's/"//g')

 echo "answer_2:$answer_2"

 echo "answer-2:$answer_2" >> answers.yml

# How many unique CpG IDs are in cpg.bed.gz?

CpG="$datasets/cpg.bed.gz"
answer_3=$(gzcat $CpG \
    |cut -f4 \
    |sort \
    |uniq \
    |wc -l )
  echo "answer_3:$answer_3"

  echo "answer-3:$answer_3" >> answers.yml

# How many sequence records are in the SP1.fq file?

SP1="$datasets/SP1.fq"
answer_4=$(cat $SP1 \
    |grep -c '@cluster')
    echo "answer_4:$answer_4"
echo "answer-4:$answer_4">> answers.yml

# How many words are on lines containing the word "bloody" in hamlet.txt?

hamlet="$datasets/hamlet.txt"
answer_5=$(cat $hamlet \
    |grep -i 'bloody'\
    |wc -w )
echo "answer_5:$answer_5"
echo "answer-5:$answer_5">>answers.yml

# What is the length of the sequence in the first record of sample.fa?

samplefa="$datasets/sample.fa"
answer_6=$(cat $samplefa \
    |grep -v '>' \
    |head -1\
    |tr -d '\n' \
    |wc -c )

    echo "answer_6:$answer_6"
    echo "answer-6:$answer_6">> answers.yml
 
 #What is the anme of the longest gene in genes.hg19.bed.gz?

 hg19="$datasets/genes.hg19.bed.gz"
 answer_7=$(gzcat $hg19 \
    | awk '{print $4, $3-$2}' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1 -d' ')

    echo "answer_7:$answer_7"
    echo "answer-7:$answer_7">> answers.yml

#How many unique chromosomes are in genes.gh19.bed.gz?

answer_8=$(gzcat $hg19 \
    |cut -f1 \
    |sort \
    |uniq \
    |wc -l )

echo "answer_8:$answer_8"
echo "answer-8:$answer_8">> answers.yml

# How many intervals are associated with CTCF (not CTCFL) in
# peaks.chr22.bed.gz ?

peaks="$datasets/peaks.chr22.bed.gz"
answer_9=$(gzcat $peaks \
    |cut -f4 \
    |sort \
    |grep -c -w 'CTCF')

echo "answer_9:$answer_9"
echo "answer-9:$answer_9">> answers.yml

# On what chromosome is the largest interval in lamina.bed?
lamina="$datasets/lamina.bed"
answer_10=$(cat $lamina \
    | awk '{print $1, $3-$2}' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1 -d' ')

echo "answer_10:$answer_10"
echo "answer-10:$answer_10">>answers.yml


