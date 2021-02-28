#!/bin/bash

while [ TRUE ]

do

	echo "Program menu"
	select option in "Date" "File list" "Uptime" "File size" \
	       "End"
	       do
	       case $option in 
			"Date") date ;;
	 		"File list") ls ;;
			"Uptime") uptime ;;
			"File size") du -sh * ;;
			"Exit") exit ;;
			*) echo "Wrong option"
	esac
	break
done 
echo -e "\n"
done
