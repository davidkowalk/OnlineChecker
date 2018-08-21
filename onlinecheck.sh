#!/bin/bash

err=0
errg=0
errn=0

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo

echo "Pinging Google"

if ( ping -c 1 google.com > /dev/null )
then
	echo
	echo "You are Online"
else

	echo
	echo "Couldn't connect to Google"
	echo "Pinging Reddit..."

	if( ping reddit.com > /dev/null)
	then
		echo
		echo -e "${GREEN}You are Online${NC}"
	else
		echo
		echo -e "${RED}You are Offline${NC}"

		if (! ping -c 1 127.0.0.1 > /dev/null)
		then
			echo
			echo "Network card not properly installed"
		fi
	fi
fi

echo
