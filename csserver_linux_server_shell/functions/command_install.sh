#!/bin/bash
#Author: stttt2003pk
#Description: install the linux steamcmd and the serverfiles for cstrike

#includ
#source ./var.sh

commandname="install"

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
#install server dir
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

#build the log if the log did not exited
if [ -d ${scriptlogdir} ]; then
	fn_print_dots "Checking for log files"
	sleep 0.3
	fn_print_info_nl "Checking for log files: log files exists"
else
	echo "Creating log dir"
	echo "================"
	sleep 1
	mkdir -pv "${rootdir}/log"
	mkdir -pv "${scriptlogdir}"
	touch "${scriptlog}"
fi

if [ ! -h "${rootdir}/log/server" ]; then
	ln -nfsv "${gamelogdir}" "${rootdir}/log/server"
fi

if [ -d "${rootdir}/Steam/logs" ]; then
	if [  ! -h "${rootdir}/log/steamcmd" ]; then
		ln -nfsv "${rootdir}/Steam/logs" "${rootdir}/log/steamcmd"
	fi
fi

fn_script_log_info "Logs installed"

#check depandencies
check_deps.sh
	
#install steam cmd and download the serverfiles
#careful from china download serverfiles waste too many time
#if u want the local version cantact stttt2003pk@gmail.com
echo ""
echo "Installing SteamCMD"
echo "================================="
sleep 1
check_steamcmd.sh















































	

