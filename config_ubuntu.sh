#!/bin/bash

sudo apt-get update

sudo apt-get -y install \
    python3-pip \
    stunnel4  \
    jq \


sudo apt purge python3-lxml python3-numpy pylint yapf3 mypy python3-influxdb python3-jedi python3-sortedcontainers python3-termcolor python3-aiohttp 
sudo apt -y autoremove 
sudo apt -y autoclean 

sudo pip3 install mypy
sudo pip3 install pandas
sudo pip3 install yapf
sudo pip3 install lxml
sudo pip3 install termcolor
sudo pip3 install pylint
sudo pip3 install sortedcontainers
sudo pip3 install aiohttp
sudo pip3 install influxdb
sudo pip3 install jedi
sudo pip3 install simplefix
sudo pip3 install google-api-python-client
sudo pip3 install google-auth-httplib2
sudo pip3 install google-auth-oauthlib

exit 0
