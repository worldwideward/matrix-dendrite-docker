#!/bin/bash

check=$(find /opt/ -name matrix_key.pem | wc -l)

if [ "$check" == 0 ]; then

	echo "Generating new server keys."

	generate-keys --private-key matrix_key.pem
	generate-keys --tls-cert server.crt --tls-key server.key
else
	
	echo "Server keys already exist."
fi

dendrite-monolith-server --tls-cert server.crt --tls-key server.key --config /opt/dendrite.yaml
