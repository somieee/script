{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders2 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders3 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders4 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders5 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders6 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders7 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders8 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders9 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders10 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders11 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders12 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders13 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders14 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders15 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'START TRANSACTION READ ONLY; select * from orders16 force index(o_custkey) where o_custkey between 1 and 100000; commit' > /dev/null; } &
wait
