#!/bin/bash
echo -e "\033[36mThis fork of watcher has been tested on  Centos 7 only\e[0m"
cd /root
echo -e "\033[33mCD to /root\e[0m"
git clone https://github.com/mylivingweb/Watcher.git
echo -e "\033[33mcloning repo\e[0m"
cd Watcher
echo -e "\033[33mCD to Watcher\e[0m"
yum install -y python python-inotify python-yaml
echo -e "\033[33mInstalling python python-inotify python-yaml\e[0m"
chmod +x watcher.py
echo -e "\033[33mchmod watcher.py to make executable\e[0m"
cp watcher.service  /etc/systemd/system/watcher.service
echo -e "\033[33mcopy watcher.service to systemd\e[0m"
echo -e "\033[36mInstall complete, you will need to copy watcher.ini to /etc/watcher.ini and edit to watch your directories\e[0m"
echo -e "\033[36mStart the system with systemctl start watcher\e[0m"
