#!/bin/bash
#name chenhaijun
#filename LVS server start stop file
#version 1.0
. /etc/init.d/functions

VIP=192.168.36.158
PORT=80
RIP=(
192.168.36.139
192.168.36.143
)

function start(){

/sbin/ipvsadm -C                                 #(清空所有)
/usr/sbin/ifconfig ens33:0 $VIP/24 up            #(添加一个虚拟网络)
/usr/sbin/route add -host $VIP dev ens33         #(添加一个主机路由)
/sbin/ipvsadm -A -t $VIP:$PORT -s rr -p 20       #(添加VIP)

for  ((i=0; i<${#RIP[*]};i++))
do
        /sbin/ipvsadm -a -t $VIP:$PORT -r ${RIP[$i]} -g -w 1  #(添加RIP节点服务器)
done
}

function stop (){

/sbin/ipvsadm -C
/usr/sbin/ifconfig ens33:0 down
/usr/sbin/route del -host $VIP dev ens33   
}


case $1 in
     start)
	start
	action "ipvs is started"  /bin/true
	;;
     stop)
	stop
	action "ipvs is stoped"    /bin/true
	;;
     restart)
	stop
	action "ipvs is stoped"   /true/bin
        start
	action "ipvs is started"  /bin/true
	;;
	*)
	echo "USAGE:$0 start|stop|restart" 
	;;
esac
