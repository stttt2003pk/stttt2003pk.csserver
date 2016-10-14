#!/bin/bash
#Author: stttt2003pk
#Description: start the cstrike server into tmux
#

#check if the server is running
#parms like -game cstrike -strictportbind +ip ${ip} -port ${port} +clientport ${clientport} +map ${defaultmap} -maxplayers ${maxplayers}
#/home/csserver/serverfiles/hlds_run -game cstrike -strictportbind +ip 192.168.100.239 -port 27015 +clientport 27005 +map de_dust2 -maxplayers 32
parms="-game cstrike -strictportbind +ip ${ip} -port ${port} +clientport ${clientport} +map ${defaultmap} -maxplayers ${maxplayers}"

status=$(tmux list-sessions 2>&1 | awk '{print $1}' | grep -Ec "^${servicename}:")

#get server name 
servername="$(awk '/^hostname/ {print $2}' serverfiles/cstrike/cs-server.cfg)"
if [ "${status}" != "0" ]; then
	fn_print_info_nl "${servername} is already running"
	fn_script_log_error "${servername} is already running"
	core_exit.sh
fi

cd "${executabledir}"
tmux new-session -d -s "${servicename}" "${executable} ${parms}" 2> "${scriptlogdir}/.${servicename}-tmux-error.tmp"

#see if the server start successful
status=$(tmux list-sessions 2>&1 | awk '{print $1}' | grep -Ec "^${servicename}:")
if [ "${status}" == "0" ]; then
	fn_print_fail_nl "Unable to start ${servername}"
	fn_script_log_fatal "Unable to start ${servername}"
	echo ""
	echo "command"
	echo "================================="
	echo "tmux new-session -d -s \"${servicename}\" \"${executable} ${parms}\"" | tee -a "${scriptlog}"
	echo ""
	echo "if u want to see why cat the log"
	echo "================================="
	cat "${scriptlogdir}/.${servicename}-tmux-error.tmp" | tee -a "${scriptlog}"
else
	echo "the ${servicename} server is online"

fi
