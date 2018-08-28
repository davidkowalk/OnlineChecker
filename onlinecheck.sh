#!/bin/bash

err=0

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo

echo "Pinging Google"

if ( ping -c 1 -W 3 google.com > /dev/null )
then
	echo
	echo -e "${GREEN}You are Online${NC}"
else
	
	err=2
	
	echo
	echo "Couldn't connect to Google"
	echo "Pinging Reddit..."
	
	if( ping -c 1 -W 3 reddit.com > /dev/null)
	then
		echo
		echo -e "${GREEN}You are Online${NC}"
	else
		err=1
		
		echo
		echo -e "${RED}You are Offline${NC}"

		if (! ping -c 1 127.0.0.1 > /dev/null)
		then
			err=3
			echo
			echo "Network card might not be properly installed"
		fi
	fi
fi

echo

exit $err
