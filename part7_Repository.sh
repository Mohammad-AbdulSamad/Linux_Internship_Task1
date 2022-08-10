#!/bin/sh

#Install tmux on your machine
Yum install tmux

#Install apache server on your machine(httpd) and Install mysql.
yum install httpd
yum update -y

# to install mysql
#install wget used to download files from the web
yum install -y wget

#download and add the repository.
wget http://repo.mysql.com/mysql-community-release-el7-7.noarch.rpm
rpm -ivh mysql-community-release-el7-7.noarch.rpm

yum update -y

#After the repository has been added, we can proceed with installing MySQ
yum install -y mysql-server

#start the service and then enable it to start on boot
systemctl start mysqld
systemctl enable mysqld

# part 3 : Create a local yum repository on your local machine(available publicly) with the zabbix rpms:
#https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/

#To create a yum repository we need to install additional software called “createrepo” :
yum install createrepo
	
#Create a repository directory (location of your yum repository and will hold the desired rpm package files).
mkdir /var/www/html/zabbix_repo

#Put RPM files into the repository directory
#wget command downloads files served with HTTP, HTTPS, or FTP over a network.
#-A : Specify comma-separated lists of file name suffixes or patterns to accept or reject.
#-r: Turn on recursive retrieving.
#-l: Specify recursion maximum depth level depth. The default maximum depth is 5.
#-P: the directory where all other files and subdirectories will be saved to
wget -A rpm -r -l 5 https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/ -P /var/www/html/zebbix_repo

#Create the repository metadata
createrepo /var/www/html/zabbix_repo/

#Create the repository configuration file
#A yum repository has its own configuration file and there are a few rules for it:
#It must be located in /etc/yum.repos.d/ directory
#It must have the .repo extension, to be recognized by yum
vi cd /etc/yum.repos.d/zabbix.repo =>
#[localrepo]
#name=zabbix Repository
#baseurl=file:///var/www/html/zabbix_repo
#gpgcheck=0
#enabled=1

#Disable all other repositories and keep only the new repo

# to use yum-config-manager
yum install -y yum-utils

#disables all repositries
yum-config-manager –-disable \*

#enable the new repo
yum-config-manager –-enable localrepo

#Install zabbix rpms from the new repo (Download zabbix, zabbix-web,php, zabbix-server, zabbix-agent rpm’s and their dependencies)
#To find the dependencies 
#yum deplist <package name> or repoquery –requires –resolve <package name> or yum provides <package name>

yum install zabbx-server zabbix-web Zabbix-agent php 

