#!/bin/bash

#IF USED IN WINDOWS BASH CONSOLE, YOU NEED TO RUN BASH AS AN ADMIN

#Mathias Nygård Evensen : Tor Borgen : Brage Fosso

x=0
while [ $x = 0 ]
do

	echo "
1. See your IP and list pings
2. Write IP and ping all (may take time to go through/it's thorough) 
3. See your IP
4. Write IP and get list of pings
5. Write only IP's with response(Automatic ip getter)
6. Write only IP's with response(Manual entry)
q - exit"
	read answer
	case "$answer" in
		1) 
				v=`curl ifconfig.me`
				p=`echo $v | sed 's/\.[0-9]*$/./'`
echo "-----------------------"
				echo "Your IP: $v"
				echo "IP before loop: $p" 
echo "-----------------------"
				#ping list of IP
				echo "list of found IP: "
				prefix=${1:-$p}

				for ip in `seq 1 254`
					do
						(ping -c1 -w1 ${prefix}${ip} > /dev/null 2>&1; [[ $? -eq 0 ]] && echo ${prefix}${ip}) &
					done
				wait 
echo "----------------------"

		x=0 ;;

		2)
			read -p "
write the three first known integers (ex 192.168.0.)
and the rest will be checked : " p
echo "---------------"
			for ip in `seq 1 254` #husk 254
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

				for ip in `seq 1 254`
					do
						(ping -c1 -w1 ${prefix}${ip} > /dev/null 2>&1 && echo ${prefix}${ip}) &
					done

				wait
echo "---------------"
			
		x=0 ;;

		5)
#automatically get the IP
ip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
echo "Your IP is" $ip
echo
echo "Printing IP's in range with reply"
#use nmap to resolve all IP's that are  up. nmap instead of ping for easy implementation and no need to store in file
#Since task 5 did not specify that it needs to be ping that are used this sollution was chosen
nmap -sP $ip/24 | awk '/is up/ {print up}; {gsub (/(|)/,""); up = $NF}'


x=0 ;;
		6)
		
 read -p "
write the first three know integers of the IP (ex 192.168.0.)
and the rest will be checked : " p


                                #ping list of IP
                                echo "list of found IP: "
nmap -sP $p"0"/24 | awk '/is up/ {print up}; {gsub (/(|)/,""); up = $NF}'

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
