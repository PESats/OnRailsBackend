#!/bin/bash

source /home/alumne/.rvm/scripts/rvm

git pull

bundle install

bin/rails db:migrate

bin/rails server
