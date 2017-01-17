#!/bin/sh

set -x
#files= "2_SPS 2_SIDX 2_IDX" #Result_FES_trace'
path="/home/som/laio_script"
trace_dir="$path/SSD_SIDX/"
trace_dir2="$path/SSD_SIDX_128/"
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

for file in SIDX_ #SIDX_1 SIDX_2 SIDX_10
do 
for i in 1 #1 2 3 4 5 6 7 8 9 10 50 #4 8 16 32 64 128
do
echo $file
cp ${trace_dir}${file}${i} ${trace_dir}${file}${i}_temp;
cp ${trace_dir2}${file}${i} ${trace_dir2}${file}${i}_temp;

        # blkparse -i ${trace_dir}${file} -o temp;
        # awk format = <R|W, lsn, sect_cnt, timestamp, sequence_num>
        egrep '(D[[:space:]]+W|D[[:space:]]+R)' ${trace_dir}${file}${i}_temp | awk '{printf "%s,%d,%d,%.3f,%d\n",$7, $8, $10, $4, NR}' > ${trace_dir}${file}${i}_RW;
        grep "R" ${trace_dir}${file}${i}_RW > ${trace_dir}${file}${i}_R
        grep "W" ${trace_dir}${file}${i}_RW > ${trace_dir}${file}${i}_W
        egrep '(D[[:space:]]+W|D[[:space:]]+R)' ${trace_dir2}${file}${i}_temp | awk '{printf "%s,%d,%d,%.3f,%d\n",$7, $8, $10, $4, NR}' > ${trace_dir2}${file}${i}_RW;
        grep "R" ${trace_dir2}${file}${i}_RW > ${trace_dir2}${file}${i}_R
        grep "W" ${trace_dir2}${file}${i}_RW > ${trace_dir2}${file}${i}_W

#rm temp;
        if [ $plotting -eq 1 ]
        then
            gnuplot << EOF

set te pos eps enhanced 20;

set xlabel "Timestamp (second)";

set ylabel "Logical Sector Number";

set style line 1 pt 3 lc rgb "green";

set style line 2 pt 14 lc rgb "red";

set pointsize 0.5;

set datafile separator ",";

set output "${file}${i}.eps";

plot "< grep R ${trace_dir}${file}${i}_R" u 4:2 ls 1 ti "SIDX", "< grep R ${trace_dir2}${file}${i}_R" u 4:2 ls 2 ti "SIDX+P-sync";

#plot "< grep R ${trace_dir}${file}${i}_R" u 4:2 ls 1 ti "IDX";

set output "${file}${i}_R.eps";

plot "< grep R ${trace_dir}${file}${i}_R" u 4:2 ls 1 ti "Read";

set output "${file}${i}_W.eps";

plot "< grep W ${trace_dir}${file}${i}_W" u 4:2 ls 2 ti "Write";

EOF
            mv *.eps ${trace_dir}plot_timestamp;

            gnuplot << EOF

set te pos eps enhanced 24;

set xtics font ", 30" 
set xlabel "Sequence Number";

set ylabel "Logical Sector Number";

set style line 1 pt 14 lc rgb "green";

set style line 2 pt 14 lc rgb "red";

set pointsize 0.5;

set datafile separator ",";

set output "${file}${i}.eps";

plot "< grep R ${trace_dir}${file}${i}_R" u 4:2 ls 1 ti "READ", "< grep W ${trace_dir}${file}${i}_W" u 4:2 ls 2 ti "WRITE";
EOF
            mv *.eps ${trace_dir}plot_seq;
        fi

#rm -rf ${file}_R ${file}_W
done
done


