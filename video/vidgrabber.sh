#!/bin/sh

echo >&2 "Checking Prerequisites";
command -v ssh >/dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed."; }
command -v lftp >/dev/null 2>&1 || { echo >&2 "I require lftp but it's not installed. Aborting."; exit 1;}
#command -v python >/dev/null 2>&1 || { echo >&2 "I require lftp but it's not installed. Aborting."; exit 1;}

echo >&2 "Enter password";
read pass

echo >&2 "Enter Video URL";
read URL
echo >&2 "Attempting to log in to remote server to download";

#sshpass -p "$pass" ssh -o StrictHostKeyChecking=no ricouzuki@ham.whatbox.ca "cd files; cd vidgrabber; python youtube-dl -U; python youtube-dl $URL;" 


command 'lftp -u ricouzuki,$pass ham.whatbox.ca -e "cd files; cd vidgrabber;"'
