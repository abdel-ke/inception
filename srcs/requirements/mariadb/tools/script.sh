#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	rc-service mariadb start

	echo "CREATE USER 'abdel-ke'@'localhost' IDENTIFIED BY '1337@sh';" | mysql -u root
	echo "CREATE DATABASE wordpress;" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON *.* TO 'abdel-ke'@'localhost' IDENTIFIED BY '1337@sh';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

	echo "CREATE USER 'abdel-ke'@'%' IDENTIFIED BY '1337@sh';" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON *.* TO 'abdel-ke'@'%' IDENTIFIED BY '1337@sh';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

	# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'" | mysql -u root
	# echo "FLUSH PRIVILEGES;" | mysql -u root
fi
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid