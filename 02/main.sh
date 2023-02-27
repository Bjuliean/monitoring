#!/bin/bash

echo "HOSTNAME =" $(hostname)
echo "TIMEZONE =" $(timedatectl | awk '{print $3}' | head -4 | grep '/')
echo "USER =" $(whoami)
echo "OS =" $(cat /etc/issue | tr -s '\l\n' ' ' | tr -s '\' ' ')
echo "DATE =" $(date -R | awk '{print $2, $3, $4, $5}')
echo "UPTIME =" $(uptime -p | awk '{print $2, $3}')
echo "UPTIME_SEC =" $(cat /proc/uptime | awk '{print $1, "seconds"}')
echo "IP =" $(netstat -rn | head -4 | tail +4 | awk '{print $1}') #$(hostname -I | awk '{print $1}')
echo "MASK =" $(netstat -rn | head -4 | tail +4 | awk '{print $3}')
echo "GATEWAY =" $(netstat -rn | head -4 | tail +4 | awk '{print $2}')
echo "RAM_TOTAL ="  $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $2/(1024*1024))} {print "Gb"}')
echo "RAM_USED =" $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $3/(1024*1024))} {print "Gb"}')
echo "RAM_FREE =" $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $4/(1024*1024))} {print "Gb"}')
echo "SPACE_ROOT =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $2/1024)} {print "Mb"}')
echo "SPACE_ROOT_USED =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $3/1024)} {print "Mb"}')
echo "SPACE_ROOT_FREE =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $4/1024)} {print "Mb"}')