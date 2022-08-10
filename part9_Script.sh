#!/bin/sh

# The script that the crontab will run
# who command used to see who is logged in the system
who | awk '{print $3,$4,"-",$1}' > /TASK1/part9_Output

