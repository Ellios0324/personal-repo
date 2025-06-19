#!/bin/bash
sus_ip_addr=`who /var/log/wtmp|awk '{print $5}'|sort -r|uniq -c|sort -nr|head -1|awk -F "(" '{print $2}'|awk -F ")" '{print $1}'`
times=`who /var/log/wtmp|awk '{print $5}'|sort -r|uniq -c|sort -nr|head -1|awk -F "(" '{print $1}'`
if [[ $times -gt 20 ]]
then
  firewall-cmd --add-rich-rule='rule family="ipv4" source address="$sus_ip_addr" reject' --permanent
  echo "$sus_ip_addr tried to log in this machine for $times times, it is really suspicious so $(tput setaf 1)this machine reject its connection request$(tput sgr0)"
else
  echo "$(tput setaf 2)There is no suspicious connection to this server!$(tput sgr0)"
fi
