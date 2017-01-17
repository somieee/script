ALTER TABLE region ADD PRIMARY KEY (r_regionkey);

ALTER TABLE nation ADD PRIMARY KEY (n_nationkey);

ALTER TABLE part ADD PRIMARY KEY (p_partkey);

ALTER TABLE supplier ADD PRIMARY KEY (s_suppkey);

ALTER TABLE partsupp ADD PRIMARY KEY (ps_partkey, ps_suppkey);

ALTER TABLE customer ADD PRIMARY KEY (c_custkey);

ALTER TABLE lineitem ADD PRIMARY KEY (l_orderkey, l_linenumber);

ALTER TABLE orders ADD PRIMARY KEY (o_orderkey);

ALTER TABLE nation ADD INDEX (n_regionkey), ADD FOREIGN KEY nation_fk1 (n_regionkey) REFERENCES region(r_regionkey);

ALTER TABLE supplier ADD INDEX (s_nationkey), ADD FOREIGN KEY supplier_fk1 (s_nationkey) REFERENCES nation(n_nationkey);

ALTER TABLE customer ADD INDEX (c_nationkey), ADD FOREIGN KEY customer_fk1 (c_nationkey) REFERENCES nation(n_nationkey);

ALTER TABLE partsupp ADD INDEX (ps_suppkey), ADD FOREIGN KEY partsupp_fk1 (ps_suppkey) REFERENCES supplier(s_suppkey);

ALTER TABLE orders ADD INDEX(o_custkey), ADD FOREIGN KEY orders_fk1 (o_custkey) REFERENCES customer(c_custkey);

ALTER TABLE lineitem ADD INDEX(l_orderkey), ADD FOREIGN KEY lineitem_fk1 (l_orderkey)  REFERENCES orders(o_orderkey);

ALTER TABLE lineitem ADD INDEX(l_partkey, l_suppkey), ADD FOREIGN KEY lineitem_fk2 (l_partkey,l_suppkey) REFERENCES partsupp (ps_partkey, ps_suppkey);



