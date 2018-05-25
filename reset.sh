#!/bin/sh
while true
do
	ping -c 2 114.114.114.114
	a=$?
	if test $a -eq 1
	then
		killall njit-client-mips
		./njit-client-mips $1 $2 $3 &
	fi
	sleep 20
done
# $1 is your account
# $2 is your password
# $3 is your adapter

