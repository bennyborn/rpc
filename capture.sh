#!/bin/bash

source ~/.rpc_config

# create directories
if [ ! -d ~/.rpc ]; then
	mkdir ~/.rpc
fi

if [ ! -d ~/.rpc/captured ]; then
	mkdir ~/.rpc/captured
fi

if [ ! -d ~/.rpc/uploading ]; then
	mkdir ~/.rpc/uploading
fi

# set tstamp and filename
tstamp=$(date "+%Y-%m-%d_%H_%M_%S")
filename=$(hostname)_$tstamp.jpg

# take picture
fswebcam -q -d /dev/video0 -r 1920x1080 --jpeg 85 -F 3 --no-banner --save ~/.rpc/captured/${filename} >/dev/null 2>&1

if test -f ~/.rpc/captured/${filename}; then

	# optimize picture
	jpegoptim -q --strip-all ~/.rpc/captured/${filename}

	# move it into upload queue
	mv ~/.rpc/captured/${filename} ~/.rpc/uploading/${filename}
else
	echo "Error. Could not take picture."
	exit 1
fi