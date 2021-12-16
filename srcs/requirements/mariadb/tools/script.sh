#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start
	# rc-service mariadb start
	# service mariadb setup
	# service mariadb start

	echo "CREATE USER '${MYSQL_USER}'@'${DOMAIN_NAME}' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
	echo "CREATE DATABASE wordpress;" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON *.* TO 'abdel-ke'@'localhost' IDENTIFIED BY '1337@sh';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

	echo "CREATE USER '${MYSQL_USER}'@'${DOMAIN_NAME}' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

	# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'" | mysql -u root
	# echo "FLUSH PRIVILEGES;" | mysql -u root
fi
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
