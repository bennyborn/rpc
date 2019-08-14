#!/bin/bash

RPC_INWX_DYNDNS_USER=""
RPC_INWX_DYNDNS_PASS=""

source ~/.rpc_config


IP_PROVIDER="ip4.ident.me"
INWX_API="https://dyndns.inwx.com/nic/update"

IP_ADDR="$(curl -sL "${IP_PROVIDER}")"
IP_STATUS="$?"

if [ -z "${IP_ADDR}" ] || [ "${IP_STATUS}" != "0" ]; then
	echo "Error: could not get IP address."
	exit 1
fi

RESULT="$(curl -sL -u "${RPC_INWX_DYNDNS_USER}:${RPC_INWX_DYNDNS_PASS}" "${INWX_API}?myip=${IP_ADDR}")"

if [ "${RESULT}" == "good" ] || [ "${RESULT}" == "nochg" ]; then
	#echo "Done. Result was \"${RESULT}\"."
	exit 0
else
	echo "Error: DynDNS update failed. Result was \"${RESULT}\"."
	exit 1
fi