#!/bin/sh
echo >&2 "Checking Prerequisites";
command -v ssh >/dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed."; }
command -v lftp >/dev/null 2>&1 || { echo >&2 "I require lftp but it's not installed. Aborting."; exit 1;}

echo >&2 "Attempting to log in to remote server to download";

spawn ssh ricouzuki@ham.whatbox.ca
expect "assword:"
send "2percy3\r"
send "pwd"
send "ls -al"
send "exit"

