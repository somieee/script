{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders2 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders3 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders4 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders5 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders6 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders7 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders8 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
wait
