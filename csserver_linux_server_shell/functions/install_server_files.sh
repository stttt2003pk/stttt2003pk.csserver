#!/bin/bash
#Author: stttt2003pk
#Description: Installs server files

fn_install_server_files_steamcmd(){
	counter="0"
	while [ "${counter}" == "0" ]||[ "${exitcode}" != "0" ]; do
		counter=$((counter+1))
		cd "${steamcmddir}"
		if [ "${counter} -le 10" ]; then
			# Attempt 1-4: Standard attempt
			# Attempt 5-6: Validate attempt
			# Attempt 7-8: Validate, delete long name dir
			# Attempt 9-10: Validate, delete long name dir, re-download SteamCMD
			# Attempt 11: Failure
		
			if [ "${counter}" -ge "2" ]; then
				fn_print_warning_nl "SteamCMD did not complete the download, retrying: Attempt ${counter}"
				fn_script_log "SteamCMD did not complete the download, retrying: Attempt ${counter}"
			fi
		
			if [ "${counter}" -ge "7" ]; then
				echo "removing $(find ${filesdir} -type d -print 0 | grep -Ez '[^/]{30}$')"
				find ${filesdir} -type d -print0 | grep -Ez '[^/]{30}$' | xargs -0 rm -rf
			fi

			if [ "${counter}" -ge "9" ]; then
				rm -rf "steamcmddir"
				check_steamcmd.sh
			fi

			# Detects if unbuffer command is available.
			if [ $(command -v stdbuf) ]; then
				unbuffer="stdbuf -i0 -o0 -e0"
			fi
			# Install
			if [ "${counter}" -le "4" ]; then
				${unbuffer} ./steamcmd.sh +login "${steamuser}" "${steampass}" +force_install_dir "${filesdir}" +app_set_config 90 mod "${appidmod}" +app_update "${appid} ${branch} +quit"
				local exitcode=$?
			elif [ "${counter}" -ge "5" ]; then
				${unbuffer} ./steamcmd.sh +login "${steamuser}" "${steampass}" +force_install_dir "${filesdir}" +app_set_config 90 mod "${appidmod}" +app_update "${appid}" ${branch} -validate +quit
				local exitcode=$?
			fi

		elif [ "${counter}" -ge "11" ]; then
			fn_print_failure_nl "SteamCMD did not complete the download, too many retrys"
			fn_script_log "SteamCMD did not complete the download, too many retrys"
			break	
		fi
	done

	# Goldsource servers commonly fail to download all the server files required.
	# Validating a few of times may reduce the chance of this issue.
	if [ "${engine}" == "goldsource" ]; then
		fn_print_information_nl "Goldsource servers commonly fail to download all the server files required. Validating a few of times may reduce the chance of this issue."
		counter="0"
		while [ "${counter}" -le "4" ]; do
			counter=$((counter+1))
			${unbuffer} ./steamcmd.sh +login "${steamuser}" "${steampass}" +force_install_dir "${filesdir}" +app_set_config 90 mod ${appidmod} +app_update "${appid}" ${branch} -validate +quit
			local exitcode=$?
		done
	fi
}

echo ""
echo "Installing ${gamename} Server"
echo "================================="
sleep 1

if [ -n "${appid}" ]; then
	fn_install_server_files_steamcmd
fi


























































