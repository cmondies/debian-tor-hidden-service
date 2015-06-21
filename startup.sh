#!/bin/sh

if [ -f /var/lib/tor/hidden_service/hostname ]; then
	echo "Your hostname:"
	cat /var/lib/tor/hidden_service/hostname
else
	echo "Starting up Tor briefly to generate your hidden service hostname. Please wait..."
	service tor start & sleep 10; service tor stop ; echo "Your hostname:" ; cat /var/lib/tor/hidden_service/hostname
fi
service tor start
