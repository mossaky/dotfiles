#! /bin/bash
# zsh_install.sh

CUR_DIR=$(dirname $0)
source ${CUR_DIR}/common_function.sh
CMD=$(package_installer)
${CMD} install zsh

# oh-my-zshもインストール
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

