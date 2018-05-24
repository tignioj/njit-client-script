#!/bin/sh
while true
do
	ping -c 2 114.114.114.114
	a=$?
	if test $a -eq 1
	then
		killall njit-client-mips
		/root/njit-client-mips $1 $2 $3 &
	fi
	sleep 20
done

