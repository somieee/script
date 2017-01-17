#!/bin/sh

set -x
trace_dir="/home/som/laio_script/"
plotting=0
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

for sub_dir in SSD_FTS #P_ONLY #SSD_SIDX_128 IDX P_ONLY
do
	cd ${trace_dir}${sub_dir}/blk
	for file in fts #psync #sidx+p idx psync
	do 
		for i in 1 2 4 6 8 10
		do 
			for j in 1 2 3 4 5 6 7 
			do
#				echo ${file}_${i}%_${j}
				echo ${file}_${i}
#cp ${file}_${i}%_${j} ${file}_${i}%_${j}_temp;
				# blkparse -i ${trace_dir}${file} -o temp;
				# awk format = <R|W, lsn, sect_cnt, timestamp, sequence_num>
#				egrep '(D[[:space:]]+W|D[[:space:]]+R)' ${file}_${i}%_${j} | awk '{printf "%s,%d,%d,%.3f,%d\n",$7, $8, $10, $4, NR}' > ${trace_dir}${file}${i}${j}_RW;
				egrep '(D[[:space:]]+W|D[[:space:]]+R)' ${file}_${i} | awk '{printf "%s,%d,%d,%.3f,%d\n",$7, $8, $10, $4, NR}' > ${trace_dir}${file}${i}_RW;
#				grep "R" ${trace_dir}${file}${i}${j}_RW > ${trace_dir}${file}${i}${j}_R
#				grep "W" ${trace_dir}${file}${i}${j}_RW > ${trace_dir}${file}${i}${j}_W

#rm temp;
				if [ $plotting -eq 1 ]
				then
					gnuplot << EOF

set te pos eps enhanced 20;

set xlabel "Timestamp (second)";

set ylabel "Logical Sector Number";

set style line 1 pt 3 lc rgb "green";

set style line 2 pt 14 lc rgb "red";

set pointsize 0.2;

set datafile separator ",";

set output "${file}${i}${j}.eps";

#plot "< grep R ${trace_dir}${file}${i}${j}_R" u 4:2 ls 1 ti "READ", "< grep R ${trace_dir}${file}${i}${j}_W" u 4:2 ls 2 ti "WRITE";

plot "< grep R ${trace_dir}${file}${i}${j}_R" u 4:2 ls 1 ti "";

set output "${file}${i}${j}_R.eps";

#plot "< grep R ${trace_dir}${file}${i}_R" u 4:2 ls 1 ti "Read";

set output "${file}${i}${j}_W.eps";

plot "< grep W ${trace_dir}${file}${i}${j}_W" u 4:2 ls 2 ti "Write";

EOF
            mv *.eps ${trace_dir}plot_timestamp;

            gnuplot << EOF

set te jpeg giant size 800,600;

set xtics font ", 30" 
set xlabel "Sequence Number";

set ylabel "Logical Sector Number";

set style line 1 pt 14 lc rgb "green";

set style line 2 pt 14 lc rgb "red";

set pointsize 0.5;

set datafile separator ",";

set output "${file}${i}${j}.eps";

plot "< grep R ${trace_dir}${file}${i}${j}_R" u 4:2 ls 1 ti "READ", "< grep W ${trace_dir}${file}${i}${j}_W" u 4:2 ls 2 ti "WRITE";
EOF
            mv *.eps ${trace_dir}plot_seq;
        fi

#rm -rf ${file}_R ${file}_W
			done
		done
	done
done



