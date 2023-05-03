#!/bin/bash

if [[ $# -eq 0 ]]; then
  HOST_NAME=$(hostname)
  TIMEZONE="$(timedatectl | grep "Time zone" | awk '{print $3}') UTC $(date +%:::z)"
  OS=$(hostnamectl | grep "Operating System" | cut -f2- -d':' | sed 's/^[[:blank:]]*//')
  DATE=$(date +"%d %B %Y %T")
  UPTIME=$(uptime -p | cut -f2- -d' ')
  UPTIME_SEC=$(awk '{printf("%1.0f", $1)}' /proc/uptime)
  IP_ADDR=$(ip route get 8.8.8.8 | grep "8.8.8.8" | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')
  IP_MASK=$(chmod +x bitmask.sh; ./bitmask.sh "$(ip address show | grep --regexp="inet[[:blank:]]$IP_ADDR" | awk -F'/' '{print $2}' | awk -F' ' '{print $1}')")
  GATEWAY=$(ip r | grep default | awk '{print $3}')
  RAM_TOTAL=$(awk '/MemTotal/ {printf("%1.3f", $2/(1024 * 1024))}' /proc/meminfo | tr , .)
  RAM_FREE=$(vmstat -s -SK | grep -m 1 "free memory" | awk '{printf("%1.3f", $1/(1024 * 1024))}' | tr , . )
  RAM_USED="$(vmstat -s -SK | grep -m 1 "used memory" | awk '{printf("%1.3f", $1/(1024 * 1024))}' | tr , .)"
  SPACE_ROOT="$(df -k / | awk '/\// {printf("%1.2f", $2 / 1024)}' | tr , .)"
  SPACE_ROOT_USED="$(df -k / | awk '/\// {printf("%1.2f", $3 / 1024)}' | tr , .)"
  SPACE_ROOT_FREE="$(df -k / | awk '/\// {printf("%1.2f", $4 / 1024)}' | tr , . )"

  echo "HOSTNAME = $HOST_NAME"
  echo "TIMEZONE = $TIMEZONE"
  echo "USER = $USER"
  echo "OS = $OS"
  echo "DATE = $DATE"
  echo "UPTIME =" "$UPTIME"
  echo "UPTIME_SEC =" "$UPTIME_SEC seconds"
  echo "IP =" "$IP_ADDR"
  echo "MASK =" "$IP_MASK"
  echo "GATEWAY =" "$GATEWAY"
  echo "RAM_TOTAL = $RAM_TOTAL GB"
  echo "RAM_USED = $RAM_USED GB"
  echo "RAM_FREE = $RAM_FREE GB"
  echo "SPACE_ROOT = $SPACE_ROOT MB"
  echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
  echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"
fi
