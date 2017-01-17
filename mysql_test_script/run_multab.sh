echo clean multab
./run_test_multab_clean.sh nvme0n1 0
sleep 1

echo prefetch-32 multab
./run_test_multab.sh nvme0n1 0
sleep 1

echo clean-ro multab 
./run_test_multab_clean.sh nvme0n1 1
sleep 1

echo prefetch-32-ro multab
./run_test_multab.sh nvme0n1 1
sleep 1

