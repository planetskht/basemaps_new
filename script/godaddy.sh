#!/usr/bin/env bash
echo "Stop Apache Server"
sudo service httpd stop
echo "Pull code from Git"
git pull
echo "Run Migration"
rake db:migrate
echo "Restart Apache Server"
sudo service httpd restart
