#!/bin/bash
#Author: stttt2003pk
#Description: Defines all functions to allow download and execution of functions using fn_fetch_function
#Used: should be included into core_opt.sh

command_install.sh(){
	functionfile="${FUNCNAME}"
	source ${functionsdir}/${functionfile}
}

check_deps.sh(){
	functionfile="${FUNCNAME}"
	source ${functionsdir}/${functionfile}
}

check_steamcmd.sh(){
	functionfile="${FUNCNAME}"
	source ${functionsdir}/${functionfile}
}


