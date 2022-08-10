!#/bin/sh
Open port 443 , 80
firewall-cmd  --permanent  --zone=public --add-port={443,80}/tcp
firewall-cmd --reload 

#Make the changes permanent
#Either by –permanent option or by editing the configuration

#Block ssh connection for your colleague ip to the VM.
firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='10.10.40.118' reject"
