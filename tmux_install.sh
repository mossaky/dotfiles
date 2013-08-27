#! /bin/bash
# tmux_install.sh

CUR_DIR=$(dirname $0)
source ${CUR_DIR}/distro.sh

CMD=$(package_installer)
sudo ${CMD} install tmux
exit 0
