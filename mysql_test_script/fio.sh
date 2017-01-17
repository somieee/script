nvme=1
ssd=0

if [ ${nvme} -eq 1 ]; then
for bs in 4k #16k 8k
do
	for qd in 1024 512 256 128 64 32 8 1
	do
		for io in 32 16 8 4 2 1
		do
		echo ${bs}_${qd}
		sudo fio --size=300g --filename=/dev/nvme0n1 --name=nvme_randread --bs=4k --direct=1 --ioengine=libaio --iodepth=${qd} --iodepth_batch_complete=${io} --numjobs=4 --rw=randread #> ${bs}_${qd}_nvme.LST
		done
	done
done
fi

if [ ${ssd} -eq	1 ]; then
for bs in 4k 16k 8k
do
for qd in 256 128 64 32 8 1
do
	echo ${bs}_${qd}
	sudo fio --size=230g --filename=/dev/sdb --name=ssd_randread --bs=${bs} --direct=1 --ioengine=libaio --iodepth=${qd} --rw=randread > ${bs}_${qd}_ssd.LST
done
done
fi
