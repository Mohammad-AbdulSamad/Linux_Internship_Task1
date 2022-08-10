#!/bin/sh

#Create a cronjob that will run at 1:30 AM every day and collect the users logged in and save them in a file, Format : timestamp – users
#Note: the cronjob can run a script.

d="$(date +"%Y_%m_%d-%H_%M_%S")"
n1="part9_temp.${d}"

#Copy Current Crontab
crontab -l > $n1

#set the shell script to be executable (Change the mode).
chmod 744 /TASK1/part9_Script.sh

# append the new cronjob to $n1 file
echo "30 1 * * * /TASK1/part9_Script.sh >/dev/null 2>&1" >> $n1 

#Copy the temporary file back to crontab using the following command. This will install new crontab. (Update crontab)
crontab $n1

#remove the temporary file
rm $n1
