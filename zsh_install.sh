#! /bin/bash
# zsh_install.sh

CUR_DIR=$(dirname $0)
source ${CUR_DIR}/distro.sh

CMD=$(package_installer)

sudo ${CMD} install zsh

# oh-my-zshもインストール
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

