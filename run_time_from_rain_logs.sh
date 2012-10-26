#!/bin/bash
path=$1
platform=$2
comparison=$3

printf "Categories, "
#Header
if [ "$platform" == "euca" ]
then

	printf "Image preparation, Launching images, SSH accessibility, Total walltime\n"
	count=4
	#2011-12-12 10:43:34,145 - RainClient - INFO - Starting Rain Client Eucalyptus
	#2011-12-12 10:43:34,646 - RainClient - INFO - TIME Image available:0.500556945801
	#2011-12-12 10:43:34,646 - RainClient - DEBUG - Creating temportal sshkey pair for EC2
	#2011-12-12 10:43:35,230 - RainClient - DEBUG - Save private sshkey into a file
	#2011-12-12 10:43:35,625 - RainClient - DEBUG - Launching image
	#2011-12-12 10:43:36,466 - RainClient - DEBUG - Waiting for running state in all the VMs
	#2011-12-12 10:46:47,700 - RainClient - INFO - TIME Boot all Images:192.07519412
	#2011-12-12 10:46:47,700 - RainClient - DEBUG - Number of instances booted 1
	#2011-12-12 10:46:47,700 - RainClient - DEBUG - Waiting to have access to VMs
	#2011-12-12 10:46:48,087 - RainClient - DEBUG - The instance i-39BD0638 with public ip 149.165.159.128 and private ip 10.128.2.2 is accessible
	#2011-12-12 10:46:48,088 - RainClient - DEBUG - All VMs are accessible: True
	#2011-12-12 10:46:48,088 - RainClient - INFO - TIME all VM are accessible via ssh:0.387294054031
	#2011-12-12 10:46:48,380 - RainClient - INFO - TIME walltime rain client Eucalyptus:194.235369921
	#2011-12-12 10:46:48,381 - RainClient - INFO - Rain Client Eucalyptus DONE
elif [ "$platform" == "openstack" ]
then
	printf "Image preparation, Launching images, IP address association, SSH accessibility, Mounting/configuring directories, Running jobs, Total walltime\n"
	count=7
	#2011-12-09 17:02:27,272 - RainClient - INFO - Starting Rain Client OpenStack
	#2011-12-09 17:02:27,388 - RainClient - INFO - TIME Image available:0.113513946533
	#2011-12-09 17:02:27,388 - RainClient - DEBUG - Creating temportal sshkey pair for EC2
	#2011-12-09 17:02:27,521 - RainClient - DEBUG - Save private sshkey into a file
	#2011-12-09 17:02:27,635 - RainClient - DEBUG - Launching image
	#2011-12-09 17:02:28,185 - RainClient - DEBUG - Waiting for running state in all the VMs
	#2011-12-09 17:03:40,456 - RainClient - INFO - TIME Boot all Images:72.8207828999
	#2011-12-09 17:03:41,098 - RainClient - DEBUG - Instance i-00000c0e associated with address 149.165.146.151
	#2011-12-09 17:03:42,217 - RainClient - INFO - TIME to associate all addresses:1.76069808006
	#2011-12-09 17:03:42,217 - RainClient - DEBUG - Waiting to have access to VMs
	#2011-12-09 17:04:04,550 - RainClient - DEBUG - The instance i-00000c0e with public ip 149.165.146.151 and private ip 10.0.1.2 is accessible
	#2011-12-09 17:04:04,551 - RainClient - DEBUG - All VMs are accessible: True
	#2011-12-09 17:04:04,551 - RainClient - INFO - TIME all VM are accessible via ssh:22.3336548805
	#2011-12-09 17:04:04,551 - RainClient - DEBUG - Creating temporal sshkey files
	#2011-12-09 17:04:04,838 - RainClient - DEBUG - Copying temporal private and public ssh-key files to VMs
	#2011-12-09 17:04:04,838 - RainClient - DEBUG - scp -i /N/u/jdiaz/871807648.pem -q -oBatchMode=yes -oStrictHostKeyChecking=no /N/u/jdiaz/254074039 /N/u/jdiaz/254074039.pub /N/u/jdiaz/254074039.sh /N/u/jdiaz/.ssh/authorized_keys /N/u/jdiaz/254074039.machines root@149.165.146.151:/tmp/
	#2011-12-09 17:04:05,629 - RainClient - DEBUG - Configuring ssh in VM and mounting home directory (assumes that sshfs and ldap is installed)
	#2011-12-09 17:04:05,630 - RainClient - DEBUG - ssh -i /N/u/jdiaz/871807648.pem -q -oBatchMode=yes -oStrictHostKeyChecking=no root@149.165.146.151 /tmp/254074039.sh
	#2011-12-09 17:04:09,009 - RainClient - INFO - TIME configure and mount home directory (using sshfs) in /tmp in all VMs:4.45779013634
	#2011-12-09 17:04:09,009 - RainClient - DEBUG - Running Job
	#2011-12-09 17:04:09,010 - RainClient - DEBUG - ssh -oBatchMode=yes -oStrictHostKeyChecking=no 149.165.146.151 /tmp/N/u/jdiaz/exit.sh
	#2011-12-09 17:04:09,916 - RainClient - INFO - TIME run job:0.906383037567
	#2011-12-09 17:04:09,917 - RainClient - DEBUG - Job Done
	#2011-12-09 17:04:10,347 - RainClient - INFO - TIME walltime rain client OpenStack:103.075106859
	#2011-12-09 17:04:10,348 - RainClient - INFO - Rain Client OpenStack DONE
elif [ "$platform" == "hadoop" ]
then
	printf "Image preparation, Launching images, SSH accessibility,Mounting/configuring directories, Hadoop cluster, Running jobs\n"
	count=6
	#2012-07-24 12:16:30,980 - RainClient - INFO - TIME Image available:0.0880479812622
	#2012-07-24 12:19:15,076 - RainClient - INFO - TIME Boot all Images:163.751625061
	#2012-07-24 12:20:24,964 - RainClient - INFO - TIME all VM are accessible via ssh:69.8881361485
	#2012-07-24 12:20:32,361 - RainClient - INFO - TIME configure and mount home directory (using sshfs) in /tmp in all VMs:7.39624881744
	#2012-07-24 12:21:07,330 - RainClient - INFO - TIME setup and start the Hadoop Cluster:34.9687409401
	#2012-07-24 12:22:01,648 - RainClient - INFO - TIME run job:54.318308115

else
	printf "0,1,2,3\n"
fi

#clientrain_1_6.log,
if [ "$comparison" == "true" ]
then
	list=`ls $path/*/clientrain_*_1.log`
elif [ "$comparison" == "false" ]
then
	list=`ls $path`
else
	list=`ls $path/clientrain_*.log`
fi
for filename in $list
do
	tmp=`cat $filename | grep TIME | cut -d"-" -f6|cut -d":" -f2`
	val=`echo "$tmp"|wc -l`
	if [ $val -gt $count ]
	then
		continue
	fi
	val=`echo "$tmp"|sed ':a;N;$!ba;s/\n/,/g'`
	category=`echo $filename|sed -ne "s/logs\/\([^/]*\)\/\([^/]*\)\/clientrain_\([^.]*\).log/\1-\3/p"`
	if [ "$category" == "" ]
	then
		category=`basename $filename|cut -d"." -f1`
	fi
	echo $category, $val
done
