#!/bin/bash

source /home/alumne/.rvm/scripts/rvm

kill `lsof -t -i:3000`

git pull

bundle install

bin/rails db:migrate

bin/rails server
