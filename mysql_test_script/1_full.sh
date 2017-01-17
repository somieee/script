{ /usr/bin/time -f "\t%e" ./mysql -D tpch -e 'select * from orders;' > /dev/null; } &
wait

