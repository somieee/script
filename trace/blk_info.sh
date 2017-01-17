#!/bin/sh

set -x
#files= "2_SPS 2_SIDX 2_IDX" #Result_FES_trace'
path="/home/som/laio_script"
trace_dir="$path/IDX/"
plotting=1
j=128

if [ ! -d ${trace_dir}plot_timestamp ]
then
    mkdir ${trace_dir}plot_timestamp
fi
if [ ! -d ${trace_dir}plot_seq ]
then
    mkdir ${trace_dir}plot_seq
fi

seq=0;

for file in idx_
do
for i in 1 2 4 6 8 10  #1 2 3 4 5 6 7 8 9 10 50
do
echo ${file}${i}
        # blkparse -i ${trace_dir}${file} -o temp;
        # awk format = <R|W, lsn, sect_cnt, timestamp, sequence_num>
        egrep 'D[[:space:]]+R' ${trace_dir}${file}${i} | awk '{printf "%d\n",$10}' > ${trace_dir}${file}${i}_cnt;

#rm ${trace_dir}${file}${selectivity}${i}_temp 
done
done



