#!/bin/sh

#Add user: user1, set uid=601 Password: redhat. The user's login shell should be non-interactive. (no ssh access to server)
#options (-p:set password // -u: user id // -s:shell (is set to sbin/nologin does not allow user to use interactive shell)
useradd -u 601 -p redhat -s /sbin/nologin user1 

#Add user1 to group TrainingGroup.
# add TrainingGroup to groups
groupadd TrainingGroup

# modify user1 group to become TrainingGroup instead of user1 group
#options (-g: set group)
usermod -g TrainingGroup user1

#Add users: user2, user3. The Additional group of the two users: user2, user3 is the admin group Password: redhat, user 3 with root permissions

# add a group named admin with password redhat
groupadd -p redhat admin

#add user2, user3 and set their group to admin, and passwords to redhat
adduser user2 -g admin -p redhat
adduser user3 -g admin -p redhat

