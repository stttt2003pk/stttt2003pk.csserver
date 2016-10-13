#!/bin/bash
#Author: stttt2003pk
#Description: create default config

echo ""
echo "Creating Configs"
echo "================================="
sleep 1

mkdir -pv "${servercfgdir}"
cd "${servercfgdir}"

echo -e "creating stttt2003pk.cfg"

cat > "${servercfgdefault}" << EOF1
// Server Name
hostname "yourcstrikename"

// RCON Password
rcon_password "yourcstrikepass"

// Server Password
sv_password ""

// Server Logging
log on
sv_logbans 1
sv_logecho 1
sv_logfile 1
sv_log_onefile 0

// disable autoaim
sv_aim 0

// disable clients' ability to pause the server
pausable 0

// maximum client movement speed
sv_maxspeed 320

// 20 minute timelimit
mp_timelimit 20

// cheats off
sv_cheats 0
EOF1

echo "creating ${servercfg} config file."
fn_script_log_info "creating ${servercfg} config file."
cp -v "${servercfgdefault}" "${servercfgfullpath}"
sleep 1

# server.cfg redirects to ${servercfg} for added security
echo "creating server.cfg."
fn_script_log_info "creating server.cfg."
touch "server.cfg"
sleep 1
echo "creating cfg redirect for security"
fn_script_log_info "creating redirect."

echo "from server.cfg redirect > to ${servercfg}"
echo "exec ${servercfg}" > "server.cfg"
sleep 1

# creating other files required
echo "creating listip.cfg."
fn_script_log_info "creating listip.cfg."
touch "${systemdir}/listip.cfg"
sleep 1

echo "creating banned.cfg"
fn_script_log_info "creating banned.cfg."
touch "${systemdir}/banned.cfg"
sleep 1

echo ""

echo "Configuring ${gamename} Server"
echo "================================="
sleep 1

read -p "Pls Enter your servername:" servername
read -p "Pls Enter your serverpass:" rconpass

echo "changing hostname."
fn_script_log_info "changing hostname."
sed -i "s/\"yourcstrikename\"/\"${servername}\"/g" "${servercfgfullpath}"
sleep 1

echo "changing rconpassword."
fn_script_log_info "changing rconpassword."
sed -i "s/\"yourcstrikepass\"/\"${rconpass}\"/g" "${servercfgfullpath}"
sleep 1















































