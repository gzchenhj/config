#!/bin/bash
md5=`md5sum -c /scripts/check_md5sum.db|grep -i false|wc -l`
f=`find /usr/local/nginx/html/ -type f |wc -l`
if [ $md5 -ne 0 ] || [ $f -ne 1849 ]
 then
	echo "md5sum -c /scripts/check_md5sum.db|grep -i false"
	echo "$f"
else
	echo "webfile is ok"
fi
