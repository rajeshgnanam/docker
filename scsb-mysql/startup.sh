#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
	echo "Initialize mysql db"
	mysqld --initialize-insecure --console

	echo "Run mysql"
    	/usr/bin/mysqld_safe & sleep 10s

    	mysql -uroot < /opt/git/mysql/1_SONAR_SCHEMA_CREATION.sql
    	mysql -uroot < /opt/git/mysql/2_RECAP_SCHEMA_TABLES_CREATION.sql
        mysql -uroot < /opt/git/mysql/3_COLLECTION_GROUP_T.sql
        mysql -uroot < /opt/git/mysql/4_INSTITUTION_T.sql
        mysql -uroot < /opt/git/mysql/5_ITEM_STATUS_T.sql
        mysql -uroot < /opt/git/mysql/6_REQUEST_TYPE_T.sql
        mysql -uroot < /opt/git/mysql/7_ALLOW_CONTAINER_LINKING.sql
        mysql -uroot < /opt/git/mysql/8_SET_TIME_ZONE.sql

        	killall mysqld

            sleep 10s

fi
	echo "DB already initialized; Starting MySQL"
	/usr/bin/mysqld_safe & tail -f /dev/null

