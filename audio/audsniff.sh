#!/bin/sh

#This is the Unix version of Audio Sniff n'Grab

echo >&2 "Checking Prerequisites";
command -v ssh >/dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed."; }
command -v lftp >/dev/null 2>&1 || { echo >&2 "I require lftp but it's not installed. Aborting."; exit 1;}
#command -v python >/dev/null 2>&1 || { echo >&2 "I require lftp but it's not installed. Aborting."; exit 1;}
