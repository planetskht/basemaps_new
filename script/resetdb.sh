#!/usr/bin/env bash

git pull

sh script/pull_data.sh

echo "Stop unicorn and nginx Server"
sudo systemctl stop nginx
sudo systemctl stop unicorn

rm -rf public/uploads/attachment
echo "db:drop.."
rake db:drop
echo "db:create.."
rake db:create
echo "db:migrate..."
rake db:migrate
echo "db:seed..."
rake db:seed

echo "Start unicorn and nginx Server"
sudo systemctl start nginx
sudo systemctl start unicorn