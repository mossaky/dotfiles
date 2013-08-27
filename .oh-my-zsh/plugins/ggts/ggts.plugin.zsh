export JAVA_HOME=/usr/local/java
export GGTS_HOME=${HOME}/springsource/ggts-3.3.0.RELEASE
export GRAILS_HOME=${HOME}/springsource/grails-2.2.3

export PATH=${PATH}:${JAVA_HOME}/bin:${GGTS_HOME}

[ ! -e /var/log/ggts ] && sudo mkdir /var/log/ggts && sudo chown ${USER}:${USER} /var/log/ggts
alias ggts='${GGTS_HOME}/GGTS >/var/log/ggts/ggts-gui.log 2>&1 &'
