#!/bin/bash
#name chenhj
#date 2019-12-28
#filemysql start mysql 
#version 1.0
mysql_sta=`/usr/local/mysql/bin/mysqld --defaults-file=/etc/my.cnf &`
user="root"
pass="123456"

. /etc/init.d/functions

if [ "$1" == "start" ]||[ "$1" == "stop" ]||[ "$1" == "restart" ]
  then
	action "Mysql $1 is ok" /bin/true
	
else
	action "Mysql $1 in false" /bin/false
	action "$0 {start|stop|restart}" /bin/false
	exit 1
fi

function mysql_start(){
  
  $mysql_sta  
}

function mysql_stop(){

 /usr/local/mysql/bin/mysqladmin -u$user -p$pass shutdown >/dev/null 2>&1
}

function mysql_restart(){
/usr/local/mysql/bin/mysqladmin -u$user -p$pass shutdown &>/dev/null

sleep 4
$mysql_sta

}

if [ "$1" == "start" ]
  then
	mysql_start
	exit 0
elif [ "$1" == "stop" ]
  then
	mysql_stop
	exit 0
elif [ "$1" == "restart" ]
  then
	mysql_restart
fi
