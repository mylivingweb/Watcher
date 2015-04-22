# About Watcher

Watcher is a daemon that watches specified files/folders for changes and
fires commands in response to those changes. It is similar to
[incron](http://incron.aiken.cz), however, configuration uses a simpler
to read ini file instead of a plain text file. Unlike incron it can also
recursively monitor directories.

It's written in Python, making it easier to hack.

##Quick Install
run this command to install and create watcher service

    curl -sL https://raw.githubusercontent.com/mylivingweb/Watcher/master/install.sh | sudo bash


## Requirements

You need Python 2.7 and the [pyinotify](http://github.com/seb-m/pyinotify)
library.

In CentOS 7 you can install these with:

    yum install -y python python-inotify python-yaml git
### Requirements if you want ELK output

1. A working [ELK Stack](https://www.digitalocean.com/community/tutorials/how-to-use-logstash-and-kibana-to-centralize-logs-on-centos-7)
2. Install [logstash-forwarder](https://www.digitalocean.com/community/tutorials/how-to-use-logstash-and-kibana-to-centralize-logs-on-centos-7#set-up-logstash-forwarder)
3. Copy config snippets to your syslog input and output conf files

## Configuration

See the provided `watcher.ini` file for an example job configuration. The
config file should reside in `/etc/watcher.ini` or `~/.watcher.ini`. You
can also specify the path to the config file as a command line parameter
using the `--config` option.

If you edit the ini file you must restart the daemon for it to reload the
configuration.

Currently outputs log with timestamp to /var/log/watcher.log

## Starting the Daemon

Make sure watcher.py is marked as executable:

    chmod +x watcher.py


Start the daemon with:

    ./watcher.py start

Stop it with:

    ./watcher.py stop

Restart it with:

    ./watcher.py restart

If you don't want the daemon to fork to the background, start it with

    ./watcher.py debug

## Adding Watcher as a service

Currently watcher service looks for watcher in /root/Watcher/watcher.py, update watcher.service if you cloned repo elsewhere.

Make sure watcher.py is marked as executable:

    chmod +x watcher.py

Copy watcher.service to /etc/systemd/system/watcher.service

    cp watcher.service  /etc/systemd/system/watcher.service

Start your new watcher service

    systemctl start watcher

Enable your watcher to start on boot

    systemctl enable watcher

Restart your watcher

    systemctl restart watcher

View status of your watcher

    systemctl status watcher

##TODO

Write script to automate install and add correct systemd scripts

~~Format output to ingest in Logstash Forwarder~~

~~Ship logs to central server~~

~~Use grok to parse logs for ingesting into elasticsearch and alerting~~

![screenshot of kibana](http://i.imgur.com/PyqLbZx.jpg)
