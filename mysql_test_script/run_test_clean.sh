#!/bin/bash

home=/home/som/bin
dir=${home}/myclean/bin
script=scripts

if [ ${2} -eq 0 ]; then
	result=/home/som/test_hdd/mysql_result/clean/rotest
else
	result=/home/som/test_hdd/mysql_result/ro/clean/single
fi


if [ 1 -eq 1 ]; then
for i in 1 5 10 15
do
	cd ${dir}
	if [ ${2} -eq 0 ]; then
		./mysqld_safe --defaults-file=~/my.cnf.4.clean &
	else
		./mysqld_safe --defaults-file=~/my.cnf.4.clean --innodb-read-only=1 &
	fi

	sleep 1
	iostat -cdmx /dev/${1} 1 > ${result}/${i} &
 	sudo blktrace -n 128 -d /dev/${1} -D ${result} -o ${i} &
	sleep 1
	./mysql -u root -e 'set global innodb_monitor_disable = all;'
	./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
	./mysql -u root -e 'set global innodb_monitor_enable = all;'
		
	./../../${script}/test_${i}.sh 

	./mysql -u root -D tpch -e 'SHOW GLOBAL STATUS;' | grep Innodb > ${result}/${i}_stat
	
	sleep 1
	killall iostat
	sudo killall blktrace
	sleep 1
	
	./mysqladmin -u root shutdown
	sleep 1
	sudo sysctl -w vm.drop_caches=3
	sleep 1
done
fi

if [ 1 -eq 0 ]; then
for i in 1 5 10 15
do
for j in 1 2 3 4
do
	cd ${dir}
	if [ ${2} -eq 0 ]; then
		./mysqld_safe --defaults-file=~/my.cnf.4.clean &
	else
		./mysqld_safe --defaults-file=~/my.cnf.4.clean --innodb-read-only=1 &
	fi
	sleep 1
	iostat -cdmx /dev/${1} 1 > ${result}/${i}_${j} &
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
