mysql -uroot -h127.0.0.1 -P4000 < create_database.sql
mysql -uroot -h127.0.0.1 -P4000 tpcc1000 < create_table.sql
mysql -uroot -h127.0.0.1 -P4000 tpcc1000 < add_fkey_idx.sql
./tpcc_load 127.0.0.1:4000 tpcc1000 root "" 1
./tpcc_start -h127.0.0.1 -P4000 -dtpcc1000 -uroot -w1 -c8 -r10 -l60
