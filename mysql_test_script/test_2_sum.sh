#./mysql -u root -e 'set global innodb_monitor_disable = all;'
#./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
#./mysql -u root -e 'set global innodb_monitor_enable = all;'
	
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select sum(o_totalprice) from orders force index(o_custkey) where o_custkey between 1 and 100000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select sum(o_totalprice) from orders2 force index(o_custkey) where o_custkey between 100001 and 200000;' > /dev/null; } &
wait
