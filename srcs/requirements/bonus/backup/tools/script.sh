#!/bin/sh
while true;
do
	time=$(date '+%Y-%m-%d %H:%M:%S')
	backup_folder="backup_${time}"
	mkdir "/backup/$backup_folder"
	cp -rf 	/data/DB/* /backup/"${backup_folder}"
	echo "backup mariadb server at $time in $backup_folder"
	sleep 5m
done