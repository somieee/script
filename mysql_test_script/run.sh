echo aio single
./run_aio.sh sdb1 0
sleep 1

echo aio multab
./run_aio_multab.sh sdb1 0
sleep 1

if [ 1 -eq 0 ];then
echo clean single
./run_test_clean.sh nvme0n1 0
sleep 1

echo clean multab
./run_test_multab_clean.sh nvme0n1 0
sleep 1

echo clean-ro single
./run_test_clean.sh nvme0n1 1
sleep 1

echo clean-ro multab 
./run_test_multab_clean.sh nvme0n1 1
sleep 1
fi

if [ 1 -eq 0 ];then
echo prefetch-128 single
./run_test.sh nvme0n1 0
sleep 1
fi

if [ 1 -eq 0 ];then
echo prefetch-128 single
./run_test.sh nvme0n1 0
sleep 1
echo prefetch-32 multab
./run_test_multab.sh nvme0n1 0
sleep 1

echo prefetch-128-ro single
./run_test.sh nvme0n1 1

sleep 1

echo prefetch-32-ro multab
./run_test_multab.sh nvme0n1 1
sleep 1
fi
echo done


