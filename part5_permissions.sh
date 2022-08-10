!#/bin/sh

#SELinux must be running in the Enforcing mode (permanent even after reboot).

# open the configuration file for SELINUX
vi /etc/selinux/config

# set the mode to enforcing
SELINUX=enforcing

#reboot to save the changes
reboot

