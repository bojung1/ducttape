#!/bin/bash 

HOST_CONDITION=0;
CHIA_CONDITION=0;
LOGPATH="/home/admin/logping.txt"; 
CHIA_HOST="192.168.86.215";


while true; do

echo "" >> ${LOGPATH}; 
sleep 30;

echo $(date "+%D %T") >> ${LOGPATH}; 
ping -q -c5 ${CHIA_HOST} >> ${LOGPATH} 2>&1; 
HOST_CONDITION=$?; 

nc ${CHIA_HOST} 8444 -w 2;
CHIA_CONDITION=$?; 


if [[ $HOST_CONDITION != 0 ]]; then 
  spd-say "PC chia host box down" -p 40 -t female1 -r -50;
  echo "Chia host box ping down" >> ${LOGPATH}; 
fi;

sleep 1; 

if [[ $CHIA_CONDITION != 0 ]]; then
  spd-say "Chia client tcp down"  -t female2 -r -50;
  echo "Chia client box tcp port down" >> ${LOGPATH}; 
fi;

echo "" >> ${LOGPATH}; 


done; 

