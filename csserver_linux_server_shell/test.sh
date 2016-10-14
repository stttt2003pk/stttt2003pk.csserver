#!/bin/bash
#Author: stttt2003pk
#Description: test

servername="$(awk '/^hostname/ {print $2}' serverfiles/cstrike/cs-server.cfg)"
echo "${servername}"
