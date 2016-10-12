#!/bin/bash
#Author: stttt2003pk
#Description: declare just variables and functions for the program
#warning:no exec scripts in this file

# Server Details
servicename="cs-server"
gamename="Counter-Strike 1.6"
engine="goldsource"

# Directories
rootdir="$(dirname $(readlink -f "${BASH_SOURCE[0]}"))"
functionsdir="${rootdir}/functions"
filesdir="${rootdir}/serverfiles"
systemdir="${filesdir}/cstrike"

tmp_dir="${rootdir}/tmp"
steamcmddir="${rootdir}/steamcmd"
#echo $filesdir

# Logging
logdays="7"
gamelogdir="${rootdir}/logs"
scriptlogdir="${rootdir}/log/script"

scriptlog="${scriptlogdir}/${servicename}-script.log"

scriptlogdate="${scriptlogdir}/${servicename}-script-$(date '+%d-%m-%Y-%H-%M-%S').log"

# Steam login
steamuser="anonymous"
steampass=""
