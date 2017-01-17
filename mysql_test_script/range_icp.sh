{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select sum(o_totalprice) from orders force index(o_custkey) where o_custkey between 1 and 150000;' > /dev/null; } &
wait

