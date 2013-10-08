#!/usr/bin/env bash
# rbenv_install.sh
#
# rvmから乗換てrbenvを使用する
CURDIR=$(dirname $0)
source ${CURDIR}/common_function.sh
CMD=$(package_installer)

RBENV_REPO=git://github.com/sstephenson/rbenv.git
RUBYBUILD_REPO=https://github.com/sstephenson/ruby-build.git

# rbenv ruby-build install
[[ ! -e ${HOME}/.rbenv/README.md ]] && ( git clone ${RBENV_REPO} ${HOME}/.rbenv || die "git clone failure : --" )
[[ ! -e ${HOME}/.rbenv/plugins ]] && mkdir -p ${HOME}/.rbenv/plugins
[[ ! -e ${HOME}/.rbenv/plugins/ruby-build/README.md ]] && ( ${RUBYBUILD_REPO} ${HOME}/.rbenv/plugins/ruby-build || die)

${CMD} install openssl
${CMD} install readline
${CMD} install libiconv

# setup profile
for prof in "${HOME}/.bash_profile ${HOME}/.zprofile"; do
	write_profile 'export PATH=${PATH}/.rbenv/bin:${PATH}' ${prof}
	write_profile 'eval "$(rbenv init -)"' ${prof}
done

### load profile
load_profile

exit 0
