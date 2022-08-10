#!/bin/sh

#Generate A New SSH Key Pair on Local Machine. 
ssh-keygen

#Copy Public Key to Remote Machine. 
#options (-i:identify file)
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.1.116

#Login to Remote Server Using SSH Keys
ssh 192.168.1.116
