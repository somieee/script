#./mysql -u root -e 'set global innodb_monitor_disable = all;'
#./mysql -u root -e 'set global innodb_monitor_reset_all = all;'
#./mysql -u root -e 'set global innodb_monitor_enable = all;'

{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 1 and 100000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 100001 and 200000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 200001 and 300000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 300001 and 400000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 400001 and 500000;' > /dev/null; } &  
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 500001 and 600000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 600001 and 700000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 700001 and 800000;' > /dev/null; } & 
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 800001 and 900000;' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders force index(o_custkey) where o_custkey between 900001 and 1000000;' > /dev/null; } &
wait
