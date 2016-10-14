#!/bin/bash
#Author: stttt2003pk
#Description: stop the cstrike server

#include test:
#source ./var.sh
#source "${functionsdir}/core_message.sh"

servername="$(awk '/^hostname/ {print $2}' serverfiles/cstrike/cs-server.cfg)"
#Get status if the server is running
status=$(tmux list-sessions 2>&1 | awk '{print $1}' | grep -Ec "^${servicename}:")
#echo "${status}"

if [ "${status}" == "0" ]; then
	fn_print_info_nl "${servername} is not running" 
	exit 0
else
	fn_print_dots "${servername}"
	echo ""
	echo "Command"
	echo "================================="
	echo "stopping the ${servername}"
	fn_print_dots "Graceful: rcon quit"
	fn_script_log_info "Graceful: rcon quit"
	tmux send -t "${servicename}" quit ENTER > /dev/null 2>&1
	for seconds in {1..3}; do
		sleep 1
		fn_print_dots "Graceful: rcon quit: ${seconds}"
	done
	fn_print_ok "Graceful: rcon quit: ${seconds}: "
	fn_print_ok_eol_nl
	fn_script_log_pass "Graceful: rcon quit: OK: ${seconds} seconds"
	sleep 1
#kill the tmux session
	tmux kill-session -t "${servicename}" > /dev/null 2>&1
	status=$(tmux list-sessions 2>&1 | awk '{print $1}' | grep -Ec "^${servicename}:")
	if [ "${status}" == "0" ]; then
		fn_print_ok_nl "${servername} stopped"
		fn_script_log_pass "Stopped ${servername}"
	else
		fn_print_fail_nl "Unable to stop${servername}"
		fn_script_log_fatal "Unable to stop${servername}"
	fi
fi
