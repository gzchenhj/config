#/bin/bashi
#name chenhj
#date 2019-12-28
#filename mysql start file
#version 1.0

. /etc/init.d/functions

function mysql(){
  if [ "$1" == "start" ]||[ "$1" == "stop" ]||[ "$1" == "restart" ]
   then 
	action "$1 mysql succeed"    /bin/true
  else
	action "$1 mysql false "    /bin/false
	action "$0 { start|stop|restart}" /bin/false
 fi
}

mysql_st=`/usr/local/mysql/bin/mysqld --defaults-file=/etc/my.cnf &`
pk=`/usr/bin/pkill mysqld`

if [ "$1"=="start" ]
 then
	`/usr/local/mysql/bin/mysqld --defaults-file=/etc/my.cnf &`
        mysql $1
	exit 0
elif [ "$1"=="stop" ]
 then
	$pk  
        mysql $1
	exit 0
elif [ "$1"=="resart" ]
 then
	$pk  sleep 3 && $mysql_st 
        mysql $1
	exit 0
else
	action "plase make start|stop|resart" /bin/false
fi
