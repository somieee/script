#!/bin/bash

home=/home/som/bin
dir=${home}/myclean/bin
#dir=${home}/mydebug/bin
script=scripts
result=/home/som/test_hdd/mysql_result/clean

for i in 5 10 15 #1
do
	echo ${i}
	cd ${dir}
#./mysqld_safe --defaults-file=~/my.cnf.4.clean --innodb-read-only=1 &
	./mysqld_safe --defaults-file=~/my.cnf.4.clean &
	sleep 1
	iostat -mx 1 > ${result}/${i}_sum &
 	sudo blktrace -n 256 -d /dev/sdb1 -D ${result} -o ${i}_sum &
	sleep 1
	./mysql -u root -e 'set global innodb_monitor_disable = all;'
	./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
	./mysql -u root -e 'set global innodb_monitor_enable = all;'
		
	./../../${script}/${i}_sum.sh 

	./mysql -u root -D tpch -e 'SHOW GLOBAL STATUS;' | grep Innodb > ${result}/${i}_sum_stat
	
	sleep 1
	killall iostat
	sudo killall blktrace
	sleep 1
	
	./mysqladmin -u root shutdown
	sleep 1
	sudo sysctl -w vm.drop_caches=3
	sleep 1
done

if [ 1 -eq 0 ]; then
for i in 1 5 10 15
do
for j in 1 2 3 4
do
	echo ${i}_${j}
	cd ${dir}
	./mysqld_safe --defaults-file=~/my.cnf.4.clean --innodb-read-only=1 &
	sleep 1
	iostat -cdmx /dev/sdb1 1 > ${result}/${i}_${j} &
	sleep 1
	./mysql -u root -e 'set global innodb_monitor_disable = all;'
	./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
	./mysql -u root -e 'set global innodb_monitor_enable = all;'
		
	./../../${script}/test_${i}.sh

	./mysql -u root -D tpch -e 'SHOW GLOBAL STATUS;' | grep Innodb > ${result}/${i}_${j}_stat
	
	sleep 1
	killall iostat
	sleep 1
	
	./mysqladmin -u root shutdown
	sleep 1
	sudo sysctl -w vm.drop_caches=3
	sleep 1
done
done
fi
