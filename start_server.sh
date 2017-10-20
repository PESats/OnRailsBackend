#!/bin/bash

source /home/alumne/.rvm/scripts/rvm

git pull origin develop

bin/rails server
