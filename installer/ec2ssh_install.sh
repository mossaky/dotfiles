#!/usr/bin/env bash
# ec2ssh_install.sh

CURDIR=$(dirname $0)
source ${CURDIR}/common_function.sh

### ruby1.9.3系を使用する
RUBY_ENV=1.9.3-p448

### install ec2ssh
if [[ $(rbenv --version) ]]; then
	current=$(cat ${HOME}/.rbenv/version)
	rbenv global ${RUBY_ENV}
	rbenv exec gem install ec2ssh
	rbenv rehash
	rbenv global ${current}
else
	die "rbenv is not installed."
fi

### bashrc setting
RC_PROFILE=${HOME}/.bashrc_custom
write_profile 'alias rbvers="rbenv versions"' ${RC_PROFILE}
write_profile 'alias ec2ssh="ec2sshw"' ${RC_PROFILE}

### function setting
[[ ! $(cat ${RC_PROFILE} | grep "function ec2ssh") ]] && cat <<\EOF >> ${RC_PROFILE}
function ec2sshw() {
	RUBY_VERSION=1.9.3-p448
	rbenv shell ${RUBY_VERSION}
	${HOME}/.rbenv/shims/ec2ssh "$@"
	rbenv shell --unset
}
EOF

### load profiles
load_profile

exit 0
