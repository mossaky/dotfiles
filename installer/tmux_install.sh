#! /bin/bash
# tmux_install.sh

CUR_DIR=$(dirname $0)
source ${CUR_DIR}/common_function.sh
CMD=$(package_installer)
${CMD} install tmux
exit 0
