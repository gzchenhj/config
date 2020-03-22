#!/bin/sh
#name chenhj
#filename mysql start and mysql stop file
#create time 2019-12-30
#version
pidfile="/usr/local/mysql/pid/mysql.pid"
path=/usr/local/mysql/bin

. /etc/init.d/functions

function start_mysql(){
 if [ -f $pidfile ]
    then
	action "mysql is runnig" /bin/true
 else
	$path/mysqld --defaults-file=/etc/my.cnf &
	action "mysql $1 succeed" /bin/true
 fi
}

function stop_mysql(){
 if [ -f $pidfile ]
   then
	/usr/bin/kill `cat $pidfile`
	rm -f $pidfile
	action "mysql $1 succeed"
 else
	action "mysql not is runing" 
fi
}

case "$1" in
	start)
	start_mysql $1
	;;
	stop)
	stop_mysql $1
	;;
	restart)
	stop_mysql $1
	sleep 3
	start_mysql $1
	;;
	*)
	echo "UASGE:$0 {start|stop|restart}"
	;;
esac
