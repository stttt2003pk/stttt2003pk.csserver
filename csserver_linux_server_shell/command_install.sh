#!/bin/bash
#Author: stttt2003pk
#Description: install the linux steamcmd and the serverfiles for cstrike

#includ
source ./var.sh

clear
echo "================================="
echo "cstrike1.6 server"
echo "stttt2003pk linux game server cstrike"
echo "by stttt2003pk"
echo "stttt2003pk@gmail.com"
echo "================================="

echo ""
echo "Server Directory"
echo "================================="
sleep 1
echo ""

pwd

echo ""

if [[ "${getopt}" == "install" ]]||[[ "${getopt}" = "i" ]]; then
	while true; do
		read -e -i "y" -p "Install the cstrike server in your linux:[y|n]" yn
		case $yn in
			[Yy]*)
				break;;
			[Nn]*)
				exit 0;;
			*)
				echo "Please answer yes or no.";;
		esac
	done
fi

#build the dir if the dir does not exited
if [ ! -d ${filesdir} ]; then
	mkdir -pv "${filesdir}";
fi

sleep 1




























	

