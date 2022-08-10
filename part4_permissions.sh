#!/bin/sh

#Copy /etc/fstab to /var/tmp and  rename to admin, the user1 could read, write and modify it, while user2 can’t do any permission.

# copy /etc/fstab to /var/tmp
cp /etc/fstab /var/tmp

#rename to admin (/var/tmp/fstab => /var/tmp/admin)
mv /var/tmp/fstab admin

#use access list for permissions as they are more efficient to be used for specific users
#setfacl: set file access control list
#options(-m: recalculate the mask, so the change of the permission will affect the mask)   
setfacl -m u:user1:rwx /var/tmp/admin
setfacl -m u:user2:--- /var/tmp/admin 

