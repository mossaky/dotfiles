#! /bin/bash
# setup.sh

DOT_FILES_HOME=$(dirname $0)

DOT_FILES=(.vimrc)
for file in ${DOT_FILES[@]}; do
	echo "DOT_FILES_HOME[${DOT_FILES_HOME}] FILE[${file}]"
	ln -s ${DOT_FILES_HOME}/$file $HOME/$file
done
