#!/bin/bash

#IF USED IN WINDOWS BASH CONSOLE, YOU NEED TO RUN BASH AS AN ADMIN

x=0
while [ $x = 0 ]
do

	echo "
1. See your IP and list pings
2. Write IP and ping all (may take time to go through/it's thorough) 
3. See your IP
4. Write IP and get list of pings
q - exit"
	read answer
	case "$answer" in
		1)
				v=`curl ifconfig.me`
				p=${v::-2}            #Vet dette er feil nå, burde bruke awk | cut -f4 -d'.' 
echo "-----------------------"
				echo "Your IP: $v" 
echo "-----------------------"
				#ping list of IP
				echo "list of found IP: "
				prefix=${1:-$p}

				for ip in seq 1 254
					do
						(ping -c1 -w1 ${prefix}${ip} > /dev/null 2>&1 && echo ${prefix}${ip}) &
					done
				wait
echo "----------------------"
		x=0 ;;

		2)
			read -p "
write the three first known integers (ex 192.168.0.)
and the rest will be checked : " p
echo "---------------"
			for ip in seq 1 254 #husk 254
				do 
					ping -c1 -w1 $p$ip
			done
echo "---------------"
			
		x=0 ;;

		3)
			v=`hostname -I`
			v2=`curl ifconfig.me`
echo "-------------------------------"
echo "Your private IP: $v
Your public  IP: $v2" 
echo "-------------------------------"
;;

		4)
			read -p "
write the three first known integers (ex 192.168.0.)
and the rest will be checked : " p
			

				#ping list of IP
				echo "list of found IP: "
				prefix=${1:-$p}

echo "---------------"

				for ip in seq 1 254
					do
						(ping -c1 -w1 ${prefix}${ip} > /dev/null 2>&1 && echo ${prefix}${ip}) &
					done

				wait
echo "---------------"
			
		x=0 ;;

		q)

			echo "Bye"
			sleep 1
			x=1 ;;
		*)

		echo "
Something went wrong.
Options are 1,2,3,4,q"
		sleep 4 ;;
	esac

done