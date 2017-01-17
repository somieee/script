{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders2 force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders3 force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders4 force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders5 force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders6 force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders7 force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e ' select * from orders8 force index(o_custkey) where o_custkey between 1 and 100000; ' > /dev/null; } &
wait
