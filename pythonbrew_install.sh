#! /bin/bash
# pythonbrew_install.sh
sudo aptitude install curl
sudo aptitude install build-essential
sudo aptitude install libbz2-dev
sudo aptitude install tk-dev
sudo aptitude install libncursesw5-dev
sudo aptitude install libcurl4-openssl-dev

\curl -kL http://xrl.us/pythonbrewinstall | bash

