#!/bin/bash
#Author: stttt2003pk
#Description: fix some lib promble by reset the *.so file

# Messages that are displayed for some fixes
fn_fix_msg_start(){
	fn_print_dots "Applying ${fixname} fix: ${gamename}"
	sleep 1
	fn_print_info "Applying ${fixname} fix: ${gamename}"
	fn_script_log_info "Applying ${fixname} fix: ${gamename}"
	sleep 1
}

fn_fix_msg_end(){
	if [ $? -ne 0 ]; then
		fn_print_error_nl "Applying ${fixname} fix: ${gamename}"
		fn_script_log_error "Applying ${fixname} fix: ${gamename}"
		exitcode=2
	else
		fn_print_ok_nl "Applying ${fixname} fix: ${gamename}"
		fn_script_log_pass "Applying ${fixname} fix: ${gamename}"
	fi
}

if [ -n "${appid}" ]; then
# Fixes: [S_API FAIL] SteamAPI_Init() failed; unable to locate a running instance of Steam,or a local steamclient.so.
	if [ ! -f "${HOME}/.steam/sdk32/steamclient.so" ]; then
		fixname="steamclient.so general"
		fn_fix_msg_start
		mkdir -pv "${HOME}/.steam/sdk32" >> "${scriptlog}"
		cp -v "${rootdir}/steamcmd/linux32/steamclient.so" "${HOME}/.steam/sdk32/steamclient.so" >> "${scriptlog}"
		fn_fix_msg_end
	fi
fi
