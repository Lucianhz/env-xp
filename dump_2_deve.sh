#!/usr/bin/env bash

#mysqldump -h 172.31.135.174 -p -u root  --default-character-set=utf8 red > dump.sql
#mysql -h rm-j6cppyl5gnbujz120.mysql.rds.aliyuncs.com -p -u jc --default-character-set=utf8 red_online < dump.sql

if [ ! -e dump_online.sql ]; then
    exec ./dump-online.sh
fi

#删除本地red 数据库
#-e
#mysql -h 127.0.0.1 --port=3406 --password=red -u red --default-character-set=utf8 --
mysqladmin -h 127.0.0.1 --port=3406 --password=red -u red drop red
mysqladmin -h 127.0.0.1 --port=3406 --password=red -u red create red
#再导入到本地mysql
mysql -h 127.0.0.1 --port=3406 --password=red -u red --default-character-set=utf8 red < dump_online.sql
echo "start merge..."
mysql -h 127.0.0.1 --port=3406 --password=red -u red --default-character-set=utf8 red < merge.sql
