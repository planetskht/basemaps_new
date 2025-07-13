#!/usr/bin/env bash

git pull

sh script/pull_data.sh

echo "Stop Server"
systemctl stop rails.service

rm -rf public/uploads/attachment
echo "db:drop.."
rake db:drop
echo "db:create.."
rake db:create
echo "db:migrate..."
rake db:migrate
echo "db:seed..."
rake db:seed

echo "Start Server"
systemctl start rails.service