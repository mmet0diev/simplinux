#!/bin/bash
if [ ! -f ~/Desktop/ram_usage.txt ]; then
	touch ~/Desktop/ram_usage.txt
fi
while true 
do
	sleep 120
	date >> ~/Desktop/ram_usage.txt
	free -h >> ~/Desktop/ram_usage.txt
	echo "--------------------->" >> ~/Desktop/ram_usage.txt
done
