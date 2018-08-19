#!/bin/bash

x=0
while [ $x = 0 ]
do

	echo "
1. See your IP and list others
2. Write IP and ping all
3. See your IP
q - exit"
	read answer
	case "$answer" in
		1)
				v=`curl ifconfig.me`
				p=${v::-2}
				echo "Your IP: $v" 

				#ping list of IP
				echo "list of found IP: "
				prefix=${1:-$p}

				for ip in `seq 1 254`
					do
						(ping -w1 ${prefix}${ip} > /dev/null 2>&1 && echo ${prefix}${ip}) &
					done
				wait
			
		x=0 ;;

		2)
			read -p "
write the three first known integers (ex 192.168.0.)
and the rest will be checked : " p
			for ip in `seq 1 254` #husk 254
				do 
					ping -w1 $p$ip
			done
			
		x=0 ;;

		3)
			v=`hostname -I`
			v2=`curl ifconfig.me`
			echo "
Your private IP: $v
Your public  IP: $v2" ;;

		q)

			echo "Bye"
			sleep 2
			x=1 ;;
		*)

		echo "
Something went wrong.
Options are 1,2,3,q"
		sleep 4 ;;
	esac

done


