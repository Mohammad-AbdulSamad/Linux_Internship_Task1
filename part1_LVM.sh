#!/bin/sh

#Create physical volumes after the partitions have been created on the second disk, where the partitions id=8e (pv) 
pvcreate /dev/sdb1
pvcreate /dev/sdb2

#Create Volume group  and set 16M as extent size (option -s)
vgcreate -s 16M vg01 /dev/sdb1 /dev/sdb2

#Create logical volume with 50 extents:
lvcreate -l 50 -n lv /dev/vg01

#Make the logical volume an ext4 file:
mkfs -t ext4 /dev/vg01/lv

#To make the mounting automatically at reboot you need to identify the UUID of your USB drive. Copy the UUID and add the following content to your /etc/fstab file

# mount destination
mnt_point="/mnt/data"

# create the destination (and its parents) if not exist
mkdir -p $mnt_point

#get UUID
#blkid : block attributus
#cut: remove sections from each line of files (-d: delimeter " " // -f:select specific field=>-f2:second field) 
uuid=$(blkid | grep -w lv | cut -d" " -f2)

# write it to /etc/fstab
# <file system> <mount point>   <type>  <options>   <dump>  <pass>
# $uuid         $mnt_point       ext4    defaults    0       2

printf '%s\t%s\text4\tdefaults\t0\t2\n' ${uuid} ${mnt_point} >> /etc/fstab
