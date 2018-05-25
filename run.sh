#!/bin/sh
FIRST=$1
if [[ $FIRST == "-h"  ||  $FIRST == "--help" ]] 
then
  echo "================================help====================="
  echo ""Adapter maybe is in the last line
  echo "Mac address:(example AA:BB:CC:DD:EE:FF)" 
  echo "for example:"
  echo "./run 12345678 abcabc eth0.2 AA:BB:CC:DD:EE:FF"
  exit
fi
cat /etc/config/network | grep "eth"
ifconfig | grep "eth"
echo -e "\n\n\n===========Usage================\n\n\n"
echo -e "./run ACCOUNT PASSWORD ADAPTER MACADDRESS\n\n\n"
echo "For example:"
echo -e "\n./run 12345678 abcabc eth0.2 AA:BB:CC:DD:EE:FF\n"
echo "=============Tips: ==========="
echo ""Adapter maybe in the last line
echo "Mac address:(example AA:BB:CC:DD:EE:FF)" 
ACCOUNT=$1
PASSWORD=$2
ADAPTER=$3
MACADDRESS=$4
chmod +x njit-client-*

if  [[ -z $ACCOUNT  ||  -z $PASSWORD  ||  -z $ADAPTER ]]
then
  exit 1
elif [[ ! `ifconfig | grep $ADAPTER` ]]
then
  echo  $ADAPTER not found
fi

#============change==mac addr===================
if [[ -n $MACADDRESS ]]
then
  ifconfig $ADAPTER down
  ifconfig $ADAPTER hw ether $MACADDRESS
  ifconfig $ADAPTER up
else 
  echo you did\'n input MACADDRESS
fi
#==============test arch and run=================
  if [[ `uname -m` == "mips" ]]
  then
    echo mips
    ./njit-client-mips $ACCOUNT $PASSWORD $ADAPTER &
  elif [[ `uname -m` == "mipsel" ]]
  then
    echo mipsel
    ./njit-client-mipsel $ACCOUNT $PASSWORD $ADAPTER &
  else
    echo unknow arch
    exit 2
  fi
#==========ping================================
./reset.sh $ACCOUNT $PASSWORD $ADAPTER
echo "Now you can open  browser to check if the network is available"

