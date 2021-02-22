#!/bin/bash

#the program updates packages zip, unzip and creates a log file

RED="\e[0;31m"
GREEN="\e[0;32m"
BLUE="\e[0;34m"
NEUTRAL="\e[0m"

currentDate=$(date +"%F")  #date

function update_pack()
{
	sudo apt-get update |& tee -a log.log_$currentDate.log &> /dev/null
	sudo apt-get upgrade -y |& tee -a log.log_$currentDate.log &> /dev/null
       echo "Update complete"	
}

function check_install()
{
	if [ $# -eq 0 ]; then
		echo -e "${RED}Error:You did not provide a parameter!$NEUTRAL" |& tee -a log_$currentDate.log
		exit 1
	fi

	for install in "$@"
	do
		dpkg -s $install &> /dev/null 
		if [ $? -eq 0 ]; then
			echo -e "${BLUE}MASSEGE:The package $install is already installed $NEUTRAL" | tee -a log_$currentDate.log

		else
			echo -e "Package $install is not installed, INSTALLATION getting started $NEUTRAL" | tee -a log_$currentDate.log
			sudo apt-get install -y $install | tee -a log_$currentDate.log &> /dev/null
			if [ $? -eq 0 ]; then
				echo -e "${GREEN} SUCCES: Package $install properly installed $NEUTRAL" | tee -a log_$currentDate.log
			else
				echo -e "${RED} ERROR INSTALLATION $install $NEUTRAL" | tee -a log_$currentDate.log

		fi

	fi
done
}

function main()
{

	update_pack
	check_install zip unzip
}
main
