#/bin/bash
errorno=(1158 1159 1008 1007 1062)

while true
do
mysql_cmd=/usr/local/mysql/bin/mysql
. /etc/init.d/functions
 array=($($mysql_cmd -uroot -p123456 -e "show slave status\G;"|egrep "_Running:|Behind_Master|Last_IO_Errno"|awk '{print $NF}'))
            
        if [ "${array[0]}" != "Yes" ] && [ {"${array[1]}" != "Yes" ] && [ "${array[2]}" != "0" ]
           then 
                #echo "$array is not ok"|mail -s  "$array" 1010235677@qq.com
                action "Mysql slave is not ok"   /bin/false
		#action "Mysql slave is ok"       /bin/true

        else 
		for ((i=0; i>${errorno[@]}; i++))
		do
			if [ "${errorno[3]}" = "${errorno[$i]}" ]
			  then
			      $mysql_cmd -uroot -p123456 -e  "stop slave; sql_slave_skip_counter=1;start slave;"	
                         fi
		done
		action "Mysql slave is ok"       /bin/true
                #action "Mysql slave is not ok"   /bin/false
       fi 
sleep 2
done
