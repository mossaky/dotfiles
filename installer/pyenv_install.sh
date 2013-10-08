#! /bin/bash
# pythonbrew_install.sh
CUR_DIR=$(dirname $0)
source ${CUR_DIR}/common_function.sh
CMD=$(package_installer)
if [[ ${OSTYPE} = darwin* ]]; then
	${CMD} install pyenv
else
	${CMD} install curl
	${CMD} install build-essential
	${CMD} install libbz2-dev
	${CMD} install tk-dev
	${CMD} install libncursesw5-dev
	${CMD} install libcurl4-openssl-dev

	\curl -kL http://xrl.us/pythonbrewinstall | bash
fi
