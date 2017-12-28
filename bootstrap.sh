#!/usr/bin/env bash

# install postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -

echo "Running apt-get update"
apt-get update

apt-get install -y postgresql postgresql-contrib

# next setup vagrant as superuser/create db
sudo -u postgres bash -c "psql -c \"CREATE USER ubuntu;\""
sudo -u postgres bash -c "psql -c \"ALTER USER ubuntu SUPERUSER CREATEDB;\""
sudo -u postgres bash -c "psql -c \"CREATE DATABASE ubuntu;\""

# install utilities
apt-get install -y supervisor git libpq-dev unixodbc unixodbc-dev

# setup virtualenv
apt-get install -y python-pip python-dev python-virtualenv celery

# install node.js and npm
apt-get install -y nodejs
apt-get install -y npm

# install redis
apt-get install -y redis-server

# setup venv
cd /apps/willo
virtualenv venv --always-copy