#!/usr/bin/env bash
#bash to check ping and telnet status.
#set -x;
#
#clear
SetParam() {
export URLFILE="port_list.txt"
export TIME=`date +%d-%m-%Y_%H.%M.%S`
export port=80
export STATUS_UP=`echo -e "\E[32m[ RUNNING ]\E[0m"`
export STATUS_DOWN=`echo -e "\E[31m[ DOWN ]\E[0m"`
export MAIL_TO="admin(at)techpaste(dot)com"
export SHELL_LOG="`basename $0`.log"
}

Telnet_Status() {

SetParam

echo -e "\n$TIME"
echo -e "Source,Port,$server1,$server2,$server3,$server4,$server5,$server6,$server7,$server8,$server9,$server10"
#echo -e "source,port,$server1,$server3,$server4,$server5,$server6,$server7,$server8,$server9,$server10"

cat $URLFILE | while read next
do

port=`echo $next`

TELNETCOUNT1=`sleep 3 | telnet $server1 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT2=`sleep 3 | telnet $server2 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT3=`sleep 3 | telnet $server3 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT4=`sleep 3 | telnet $server4 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT5=`sleep 3 | telnet $server5 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT6=`sleep 3 | telnet $server6 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT7=`sleep 3 | telnet $server7 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT8=`sleep 3 | telnet $server8 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT9=`sleep 3 | telnet $server9 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`
TELNETCOUNT10=`sleep 3 | telnet $server10 $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`

if [ $TELNETCOUNT1 -eq 1 ] ; then
res1="\E[32mOpen\E[0m";
else
res1="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server1:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server1:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT2 -eq 1 ] ; then
res2="\E[32mOpen\E[0m";
else
res2="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server2:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server2:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT3 -eq 1 ] ; then
res3="\E[32mOpen\E[0m";
else
res3="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server3:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server3:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT4 -eq 1 ] ; then
res4="\E[32mOpen\E[0m";
else
res4="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server4:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server4:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT5 -eq 1 ] ; then
res5="\E[32mOpen\E[0m";
else
res5="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server5:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server5:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT6 -eq 1 ] ; then
res6="\E[32mOpen\E[0m";
else
res6="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server6:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server6:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT7 -eq 1 ] ; then
res7="\E[32mOpen\E[0m";
else
res7="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server7:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server7:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT8 -eq 1 ] ; then
res8="\E[32mOpen\E[0m";
else
res8="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server8:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server8:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT9 -eq 1 ] ; then
res9="\E[32mOpen\E[0m";
else
res9="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server9:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server9:$port/ is DOWN!!!" $MAIL_TO;
fi

if [ $TELNETCOUNT10 -eq 1 ] ; then
res10="\E[32mOpen\E[0m";
else
res10="\E[31mNot Listen\E[0m";
echo -e "$TIME : Port $port of URL http://$server10:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server10:$port/ is DOWN!!!" $MAIL_TO;
fi

echo -e "$(hostname),$port,$res1,$res2,$res3,$res4,$res5,$res6,$res7,$res8,$res9,$res10";
#echo -e "$(hostname),$port,$res1,$res3,$res4,$res5,$res6,$res7,$res8,$res9,$res10";
done;
}

server1=172.18.X.X
server2=172.18.X.X
server3=172.18.X.X
server4=172.18.X.X
server5=172.18.X.X
server6=10.10.X.X
server7=192.168.X.X
server8=172.18.X.X
server9=172.18.X.X
server10=172.18.X.X

Main() {
#Ping_Hosts

Telnet_Status
}
SetParam
Main | tee -a $SHELL_LOG
