#!/bin/bash
#Author: stttt2003pk
#Description: core operation choice

#include:
source ./var.sh
source ${functionsdir}/core_message.sh
source ${functionsdir}/core_functions.sh
source ${functionsdir}/core_dl.sh

fn_getopt_generic(){
case "${getopt}" in
	i|install|ai)
		command_install.sh;;
	st|start)
		command_start.sh;;
	sp|stop)
		command_stop.sh;;
	*)
	if [ -n "${getopt}" ]; then
		echo -e "${red}Unknown command${default}: $0 ${getopt}"
		exitcode=2
	fi	
	echo "Usage: $0 [option]"
	echo "${gamename} - Cstrike Linux Server Manager - Version 0.1"
	echo -e ""
	echo -e "${lightyellow}Commands${default}"
	{
		echo -e "${blue}start\t${default}st |Start the server."
		echo -e "${blue}stop\t${default}sp |Stop the server."
		#echo -e "${blue}restart\t${default}r  |Restart the server."
		echo -e "${blue}install\t${default}i  |Install the server."
	} | column -s $'\t' -t
	esac
}

getopt=$1

fn_getopt_generic
