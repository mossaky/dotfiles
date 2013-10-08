#! /bin/bash
# bashrc_update.sh

RC_CUSTOM=${HOME}/.bashrc_custom

[ -e ${RC_CUSTOM} ] && rm -f ${RC_CUSTOM}

touch ${RC_CUSTOM}

# AWS Env
cat ${HOME}/dotfiles/.oh-my-zsh/plugins/aws/aws.plugin.zsh >> ${RC_CUSTOM}

# JAVA Env
cat ${HOME}/dotfiles/.oh-my-zsh/plugins/ggts/ggts.plugin.zsh >> ${RC_CUSTOM}

# RVM Env
echo "source ${HOME}/.rvm/scripts/rvm" >> ${RC_CUSTOM}

# PerlBrew Env
#echo "source ${HOME}/perl5/perlbrew/etc/bashrc" >> ${RC_CUSTOM}

# PythonBrew env
#echo '[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc' >> ${RC_CUSTOM}

source ${HOME}/.bashrc
