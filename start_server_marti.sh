#!/bin/bash

source /home/alumne/.rvm/scripts/rvm

if [ -f tmp/pids/server.pid ]; then
  pid=$(cat tmp/pids/server.pid)
  echo "Killing $pid"
  kill $pid
fi

git pull

bundle install

bin/rails db:migrate

echo "Starting server.."
bin/rails server
