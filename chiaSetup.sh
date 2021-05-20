#!/bin/bash
cd /chia-blockchain
. ./activate
chia init
if [ "$1" == "generate" ]; then
  echo "to use your own keys pass them as a text file -v /path/to/keyfile:/path/in/container and -e keys=\"/path/in/container\""
  chia keys generate
else
  chia keys add -f $1
fi

if [ ! "$(ls -A /plots)" ]; then
  echo "Plots directory appears to be empty and you have not specified another, try mounting a plot directory with the docker -v command "
fi

sed -i 's/localhost/127.0.0.1/g' $2/.chia/mainnet/config/config.yaml

