#!/bin/bash

# install mariadb server and start it
yum install mariadb-server
yum enable mariadb
systemctl start mariadb

# open ports in iptables from mariadb. (3306)
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
# make changes permanent
iptables-save > /etc/sysconfig/iptables

# create the database
mysql -e "CREATE DATABASE studentdb;"

# create the user
mysql -e "CREATE USER mohammad@localhost IDENTIFIED BY 'mohammad';"

# handle privileges
mysql -e "GRANT ALL PRIVILEGES ON studentdb.* TO 'mohammad'@localhost;"
mysql -e "FLUSH PRIVILEGES;"

#sign in using the new user created
mysql -u mohammad -p
#enter the password

#create a table with the name student_info
CREATE TABLE student_info( firstname VARCHAR(10) NOT NULL, lastname VARCHAR(10) NOT NULL, program VARCHAR(20) NOT NULL, gradution_year INT NOT NULL, student_num INT NOT NULL AUTO_INCREMENT, PRIMARY KEY (student_num));

#use the table 
use student_info;

#Insert values
INSERT INTO student VALUE ('Allen', 'Brown', 'Mechanical', 2018, 110001);
