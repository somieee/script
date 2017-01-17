SET FOREIGN_KEY_CHECKS = 0;

load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/region.tbl' into table tpch.region fields terminated by '|';
load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/nation.tbl' into table tpch.nation fields terminated by '|';
load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/part.tbl' into table tpch.part fields terminated by '|';
load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/supplier.tbl' into table tpch.supplier fields terminated by '|';
load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/partsupp.tbl' into table tpch.partsupp fields terminated by '|';
load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/customer.tbl' into table tpch.customer fields terminated by '|';
load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/orders.tbl' into table tpch.orders fields terminated by '|';
load data infile '/home/som/benchmarksql/tpch_2_16_1/dbgen/scale10/lineitem.tbl' into table tpch.lineitem fields terminated by '|';

SET FOREIGN_KEY_CHECKS = 1;
