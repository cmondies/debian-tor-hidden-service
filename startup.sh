#!/bin/sh
echo "Starting up Tor briefly to generate your hidden service hostname. Please wait..."
service tor start & sleep 10; service tor stop ; echo "Your hostname:" ; cat /var/lib/tor/hidden_service/hostname
service tor start
