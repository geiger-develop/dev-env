#!/usr/bin/env bash

echo "Running apt-get update"
apt-get update

# install postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
$ wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -

apt-get install postgresql postgresql-contrib

# install utilities
apt-get install -y supervisor git libpq-dev unixodbc unixodbc-dev

# setup virtualenv
apt-get install -y python-pip python-dev python-virtualenv

# install node.js and npm
apt-get install -y nodejs
apt-get install -y npm
