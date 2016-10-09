#!/bin/bash
#Author: stttt2003pk
#Description: declare just variables and functions for the program
#warning:no exec scripts in this file

rootdir="$(dirname $(readlink -f "${BASH_SOURCE[0]}"))"
filesdir="${rootdir}/serverfiles"
#echo $filesdir
