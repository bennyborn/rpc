#!/bin/bash

RPC_WEBDAV_HOST=""
RPC_WEBDAV_USER=""
RPC_WEBDAV_PASS=""
RPC_WEBDAV_MAX_FILES=3

source ~/.rpc_config

DIR=~/.rpc/uploading/*.jpg

n=1
for file in $DIR; do

	if [ ! -s "$file" ]; then
		exit 1
	fi

	echo -n "uploading $file ... "

	# upload to WebDAV
	status_code=$(curl --write-out %{http_code} --silent --output /dev/null --user "${RPC_WEBDAV_USER}:${RPC_WEBDAV_PASS}" -T $file "http://${RPC_WEBDAV_HOST}/")
	
	# handle response
	if [[ "$status_code" -ne 201 ]] ; then
  		echo -e "\e[31mFAILED! (got $status_code)\e[0m"
	else
  		echo -e "\e[32mCOMPLETE\e[0m"
  		rm $file
	fi

	# break loop after $RPC_WEBDAV_MAX_FILES
	if [[ $n == $RPC_WEBDAV_MAX_FILES ]]; then
       break
   	else
		n=$(( n + 1 ))
	fi

done