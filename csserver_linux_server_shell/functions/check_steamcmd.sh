#!/bin/bash
#install_steamcmd.sh function
#Author: stttt2003pk

fn_install_steamcmd(){
	if [ ! -d "${steamcmddir}" ]; then
		mkdir -pv "${steamcmddir}"
	fi
	if [ ! -d "${tmp_dir}" ]; then
		mkdir -pv "${tmp_dir}"
	fi
	fn_fetch_file "http://media.steampowered.com/client/steamcmd_linux.tar.gz" "${tmp_dir}" "steamcmd_linux.tar.gz"
	fn_dl_extract "${tmp_dir}" "steamcmd_linux.tar.gz" "${steamcmddir}"
	chmod +x "${steamcmddir}/steamcmd.sh"
}

#Anonymous user login
#haha i do not know how to use a specified username and password to login steam by steam cmd -_-
if [ -z "${steamuser}" ]; then
	fn_print_error_nl "Steam login not set. Using anonymous login."
	if [ -d "${scriptlogdir}" ]; then
		fn_script_log_error "Steam login not set. Using anonymous login."
	fi
	steamuser="anonymous"
	steampass=""
	sleep 2
fi

if [ ! -f "${steamcmddir}/steamcmd.sh" ]; then
	fn_print_error_nl "SteamCMD is missing"
	fn_script_log_error "SteamCMD is missing"
	sleep 1
	fn_install_steamcmd
else
	fn_print_information "SteamCMD is already installed..."
	fn_print_ok_eol_nl
fi












































