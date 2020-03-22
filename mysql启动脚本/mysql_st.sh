#!/bin/bash
#name chehj
#create 2019-12-29 22:30
#file by mysql start mysql stop file 
#version 1.1
pid=/usr/local/mysql/pid/mysql.pid
path=/usr/local/mysql/bin
. /etc/init.d/functions
if [ "$1" = "start" ]||[ "$1" = "stop" ]||[ "$1" = "restart" ] 
  then
	echo "mysql arg is ok" 
else	
	echo "uasge:$0 {start|stop|restart}"
	exit 1
fi

function mysql_start(){
 if [ -n $pid ]
   then
	$path/mysqld --defaults-file=/etc/my.cnf &
	action "mysql $1 succeed"   /bin/true
 else
	action "mysql $1 false" /bin/false
fi
} 

function mysql_stop(){
 if [ -n $pid ]
   then
	/usr/bin/kill -USR2 `cat $pid`
	action "mysql $1 succeed"  /bin/true
 else
	action "mysql $1 false"   /bin/false
fi
}

function mysql_restart(){
 if [ -n $pid ]
    then
	/usr/bin/kill -USR2 `cat $pid`
	$path/mysqld --defaults-file=/etc/my.cnf &
	action "mysql $1 succeed"   /bin/true
 else
	action "mysql $1 flase"    /bin/true

fi
}


case "$1" in
	start|START) mysql_start $1
	;;
	stop|STOP)  mysql_stop $1
	;;
	restart|RESTART) mysql_restart $1
	;;
	*) echo "mysql server $1 flase"
	;;
esac


