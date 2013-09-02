#! /bin/bash 

function package_installer() {
	case $(choose_ostype) in
		darwin*)
			cmd=$(which brew)
		;;
		redhat*)
			cmd=$(which yum)
		;;
		ubuntu*)
			cmd=$(which aptitude)
		;;
	esac
	echo ${cmd}
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
