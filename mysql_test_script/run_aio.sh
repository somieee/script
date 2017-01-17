#!/bin/bash

# ${1} == device
# ${2} == READ ONLY ( 1 == enable, 0 == disable )
# ${3} == MYSQL Server DIR - Related to # OF PREFETCH
# ${4} == MYSQL configuration file - Related to # of REAP_N

home=/home/som/bin
dir=${home}/${3}/bin
script=scripts
conf=../my.cnf.${4}
blk=0

if [ ${2} -eq 1 ];then
	result=/home/som/test_hdd/mysql_result/ro/32/aiotest
else
	result=/home/som/test_hdd/mysql_result/32/aiotest
fi

if [ 1 -eq 1 ]; then
for i in 1 #5 10 15
do
	cd ${dir}
		./mysqld_safe --defaults-file=${conf} &
	sleep 1
	echo ${1} ${2} ${3} ${4} >> ${result}/${i}
	iostat -cdmx /dev/${1} 1 >> ${result}/${i} &
 	if [ ${blk} -eq 1 ]; then
		sudo blktrace -n 128 -d /dev/${1} -D ${result} -o ${i} &
	fi
	sleep 1
	./mysql -u root -e 'set global innodb_monitor_disable = all;'
	./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
	./mysql -u root -e 'set global innodb_monitor_enable = all;'
	if [ ${2} -eq 0 ]; then
		./../../${script}/test_${i}.sh
	else
		./../../${script}/ro_${i}.sh
	fi
	echo ${1} ${2} ${3} ${4} >> ${result}/${i}_stat
	./mysql -u root -D tpch -e 'SHOW GLOBAL STATUS;' >>  ${result}/${i}_stat
	
	sleep 1
	killall iostat
	if [ ${blk} -eq 1 ];then
		sudo killall blktrace
		sleep 1
	fi
	
	./mysqladmin -u root shutdown
	sleep 1
	sudo sysctl -w vm.drop_caches=3
	sleep 1
	if [ ${blk} -eq 1 ];then
		cd ${result}
		sudo blkparse -i ${i}.blktrace.0 -o ${i}_blk
		sleep 1
		sudo rm ${i}.blktrace.*
		sleep 1
		echo ${1} ${2} ${3} ${4} >> ${result}/${i}_R
		egrep '(D[[:space:]]+R)' ${i}_blk | awk '{printf "%s,%d,%d,%.3f,%d\n",$7, $8, $10, $4, NR}' >> ${i}_R;
		sudo rm ${i}_blk
		sleep 1
	fi
done
fi

if [ 1 -eq 0 ]; then
for i in 1 #5 10 15
do
	for j in 1 #2 3 4
	do
		cd ${dir}
			./mysqld_safe --defaults-file=../my.cnf.aio &
		sleep 1
		
		echo ${i} >> ${result}/${i}

		iostat -cdmx /dev/${1} 1 > ${result}/${i}_${j}_aiotest &
		sleep 1
		./mysql -u root -e 'set global innodb_monitor_disable = all;'
		./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
		./mysql -u root -e 'set global innodb_monitor_enable = all;'
			
		if [ ${2} -eq 0 ]; then
			./../../${script}/test_${i}.sh
		else
			./../../${script}/ro_${i}.sh
		fi

		./mysql -u root -D tpch -e 'SHOW GLOBAL STATUS;' | grep Innodb > ${result}/${i}_${j}_stat_aiotest
		
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
