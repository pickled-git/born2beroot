#!/bin/bash

arch=$(uname -a)
pcpu=$(grep -c "physical id" /proc/cpuinfo)
vcpu=$(grep -c "processor" /proc/cpuinfo)
ram=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
total_disk=$(df -h --total | grep total | awk '{print $2}')
used_disk=$(df -h --total | grep total | awk '{print $3}')
av_disk=$(df -k --total | grep total | awk '{print $5}')
cpu_load=$(top -bn1 | grep '^%Cpu(s)' | awk '{printf("%.1f%%\n", $2+$4)}')
last_boot=$(who -b | awk '$1=="system" {print $3 " " $4}')
lvm=$(lsblk | grep "lvm" | wc -l)
lvm=$(if [ $lvm_use -eq 0 ]; then echo no; else echo yes; fi)
tcp=$(ss -t | grep ESTAB | wc -l)
user_log=$(who | wc -l)
ip_address=$(hostname -I | awk '{print $1}')
mac_address=$(ip link show | awk '/ether/ {print $2}')
sudo_cmd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

message="
       ------------------------------------------------
       Architecture    : $arch
       ------------------------------------------------
       Physical CPUs   : $pcpu
       Virtual CPUs    : $vcpu
       Memory Usage    : $ram
       Disk Usage      : $used_disk/${total_disk} ($av_disk)
       CPU Load        : $cpu_load
       ------------------------------------------------
       Last Boot       : $last_boot
       LVM use         : $lvm
       ------------------------------------------------
       TCP Connections : $tcp ESTABLISHED
       Users logged    : $user_log
       Network         : IP $ip_address ($mac_address)
       Sudo            : $sudo_cmd commands used
       ------------------------------------------------"

echo "$message" | wall
