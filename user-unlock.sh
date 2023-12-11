#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 

red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
echo " "
echo " "
echo " "
read -p "Input USERNAME to unlock: " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
# proses mengganti passwordnya
passwd -u $username
clear
  echo " "
  echo " "
  echo " "
  echo "-------------------------------------------"
  echo -e "Username ${blue}$username${NC} successfully ${green}UNLOCKED${NC}."
  echo -e "Access for Username ${blue}$username${NC} has been restored"
  echo "-------------------------------------------"
else
echo " "
echo -e "Username ${red}$username${NC} not found in your server."
echo " "    
	exit 1
fi
