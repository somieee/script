home=/home/som/bin/
dir=${home}/${1}/bin
script=scripts
conf=../my.cnf.aio
result=/home/som/test_hdd/mysql_result/

for i in 1 #2 3
do
	for max in 1 #5 10 20 30 40 50 60
	do
		cd ${dir}
			./mysqld_safe --defaults-file=${conf} &
		sleep 1
		echo ${i} >> ${result}/${1}_${max}.LST
		iostat -cdmx /dev/sdb1 1 >> ${result}/${1}_${max}.LST &
		sleep 1
		./mysql -u root -e 'set global innodb_monitor_disable = all;'  
		./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
		./mysql -u root -e 'set global innodb_monitor_enable = all;'   
		
		./../../${script}/${max}.sh
		
		echo ${i} >> ${result}/${1}_${max}_stat.LST
		./mysql -u root -D tpch -e 'SHOW GLOBAL STATUS;' >>  ${result}/${1}_${max}_stat.LST

		sleep 1
		
		killall iostat

		./mysqladmin -u root shutdown
		sleep 1
		sudo sysctl -w vm.drop_caches=3
		sleep 1
	done
done
