#!/bin/bash
# ggts_install.sh

CUR_DIR=$(dirname $0)

# Java Install
[ ! -d /usr/java ] && sudo mkdir -p /usr/java

# jdk install
for jdk in $(ls ${CUR_DIR}/.java/jdk*); do
	echo "jdk[$jdk]"
	sudo tar zxvf $jdk -C /usr/java
done

LATEST_JDK=$(find /usr/java -maxdepth 1 -mindepth 1 -type d | sort -r | head -n1)
if [ "${LATEST_JDK}" != "" ]; then
	if [ -d ${LATEST_JDK} ] && [ -h /usr/local/java ]; then
		sudo rm /usr/local/java
	fi
	sudo ln -s ${LATEST_JDK} /usr/local/java
fi


# ggts install
export JAVA_HOME=/usr/local/java
export PATH=$PATH:${JAVA_HOME}/bin
for ggts in $(ls ${CUR_DIR}/.java/groovy-grails-tool-suite*); do
	echo "GGTS[$ggts]"
	./${ggts}
done
