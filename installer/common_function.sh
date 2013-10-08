#! /bin/bash 
# common_function.sh

function package_installer() {
	case $(choose_ostype) in
		darwin*)
			echo $(which brew)
		;;
		redhat*)
			echo "sudo "$(which yum)
		;;
		ubuntu*)
			echo "sudo "$(which aptitude)
		;;
	esac
	return 0
}

function choose_ostype() {
	case ${OSTYPE} in
		darwin*)
			# Mac向け設定
			echo "darwin"
		;;
		linux*)
			# 更にDistoributionを判定する
			choose_linux
		;;
	esac
	return 0
}

function choose_linux() {
	case $(lsb_release -i --short) in
		CentOS | Scientific)
			echo "redhat"
		;;
		LinuxMint)
			echo "ubuntu"
		;;
	esac
	return 0
}

function die() {
	echo $1 >& 2
	exit 1
}

function write_profile() {
	[[ ! $(cat $2 | grep "$1") ]] && echo "$1" >> $2
}

function load_profile() {
	for p in $(grep "^/" /etc/shells); do
		exec $p -l
	done
}
