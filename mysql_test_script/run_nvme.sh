echo aio single nvme
./run_aio_nvme.sh nvme0n1 0
sleep 1

echo aio multab nvme
./run_aio_multab_nvme.sh nvme0n1 0
sleep 1
