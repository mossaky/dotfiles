#! /bin/bash

function package_installer() {
	cmd=""
	if [ $(which aptitude) != "" ]; then
		cmd=$(which aptitude)
	elif [ $(which yum) != "" ]; then
		cmd=$(which yum)
	elif [ $(which brew) != "" ]; then
		cmd=$(which brew)
	fi
	echo ${cmd}
	return 0
}

