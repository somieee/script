# FIND WHICH CONFIGURATION GIVES THE BEST DEVICE UTIL
# ${1} DEVICE e.g. sba1 , nvme0n1
# ${2} READ ONLY MODE, 1 == ENABLE 0 == DISABLE
# ${3} MYSQL Server - Related to # of AIO submissions.
# ${4} MYSQL Configuration file - Related to # of AIO reaps.
# e.g. ./run_aio.sh nvme0n1 0 aiotest_64 4
# means Device: NVMe, Read only mode off, Submit 64 AIO requests, The minimum AIO reap is 4(min_nr is 4 in io_getevents) 

dev=nvme0n1
#ro=0
for ro in 0 1
do
	for prefetch in aiotest_512  #aiotest aiotest_64 aiotest_128 aiotest_256 aiotest_512 aiotest_1024
	do
		for reap in aio #2 4 8 16 32 aio
		do
			./run_aio.sh ${dev} ${ro} ${prefetch} ${reap}
			sleep 1
		done
	done
done
