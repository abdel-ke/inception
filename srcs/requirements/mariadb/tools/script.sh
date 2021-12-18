#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start
	# rc-service mariadb start
	# service mariadb setup
	# service mariadb start

	echo "CREATE USER '${DATABASE_USER}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}';" | mysql -u ${MYSQL_ROOT}
	echo "CREATE DATABASE ${DATABASE_NAME};" | mysql -u ${MYSQL_ROOT}
	echo "GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}';" | mysql -u ${MYSQL_ROOT}
	echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT}

	echo "CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';" | mysql -u ${MYSQL_ROOT}
	echo "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';" | mysql -u ${MYSQL_ROOT}
	echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT}

	echo "ALTER USER '${DATABASE_USER}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}'" | mysql -u ${MYSQL_ROOT}
	echo "ALTER USER '${MYSQL_ROOT}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'" | mysql -u ${MYSQL_ROOT}
	# mysql -u ${MYSQL_ROOT} -d ${DATABASE_NAME} -p'${MYSQL_ROOT_PASSWORD}' < /wp.sql
	sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
fi
rc-service mariadb start
rc-service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
# cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'