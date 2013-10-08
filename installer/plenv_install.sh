#!/usr/bin/env bash
# plenv_install.sh
#
# perlbrewからplenvへ乗換

CURDIR=$(dirname $0)
source ${CURDIR}/common_function.sh
CMD=$(package_installer)

PLENV_REPO=git://github.com/tokuhirom/plenv.git
PLENV_ROOT=${HOME}/.plenv

PERLBUILDER_REPO=git://github.com/tokuhirom/Perl-Build.git
PLENV_PLUGIN_DIR=${PLENV_ROOT}/plugins

git --version || die "git is not installed."

### setup plenv
git clone ${PLENV_REPO} ${PLENV_ROOT} || die "git clone failure: ${PLENV_REPO}"
for prof in "${HOME}/.bash_profile ${HOME}/.zprofile"; do
	write_profile 'export PLENV_ROOT=${HOME}/.plenv' ${prof}
	write_profile 'export PATH=${PLENV_ROOT}/bin:${PATH}' ${prof}
	write_profile 'eval "$(plenv init -)"' ${prof}
done

### setup Perl-Builder
mkdir -p ${PLENV_PLUGIN_DIR}
git clone ${PERLBUILDER_REPO} ${PLENV_PLUGIN_DIR}/perl-build || die "git clone failure : ${PERLBUILDER_REPO}"

### load profile
load_profile
