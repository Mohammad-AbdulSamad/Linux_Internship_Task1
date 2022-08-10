#!/bin/sh

#Create a process to sleep fro 10 minutes (600 seconds) and run in the background
sleep 600 &

# get the active processes,and get the id
id=$(ps -aux| grep -w 'sleep'| awk '(NR ==1){print $2}')

#print the id of the process
ps -aux| grep -w 'sleep 600'
echo $id

#kill the process using the id
kill -s 9 $id
